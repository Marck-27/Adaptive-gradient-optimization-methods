% ejemplos minimización con metodos AGO:

clear; close all; clc;
addpath((genpath(pwd)));

crea_video=0;% 0<--- No    1<---Si

% Creamos video
if crea_video==1
    fprintf('\n*** CREANDO VIDEO ***\n ')
    my_video=VideoWriter('video.avi');% Nombre del video
    my_video.FrameRate=10;
    my_video.Quality=100; % calidad del video
    open(my_video); % inicia grabació del video (HAY QUE CERRARLO MÁS ADELANTE)
end

m=6; %<--- seleccionamos metodo
nit=100; % iteraciones de minimización

nx=1;nz=1;

if m==0
    meth='Stepest desc';
    alfa =0.001;
elseif m==1
    meth='AdaGrad';
    % Inicializamos parámetros del método AdaGrad:
    alfa=0.9; % step length 
    [St,eps]=AdaGrad_init_param(nz,nx);       
elseif m==2     
    meth='RMSProp';
    alfa=0.26; % step length
    % Inicializamos parámetros del método RMSProp:
    [St,beta1,eps]=RMSProp_init_param(nz,nx);       
elseif m==3
    meth='Adadelta';
    alfa=0.21; % step length
    % Inicializamos parámetros del método Adadelta:
    [beta1,St,Dt,eps,xi0]=ADADELTA_init_param(nz,nx);
elseif m==4
    meth='ADAM';        
    alfa=1; % step length 
    % Inicializamos parámetros del método ADAM:        
    [tt,Vt,St,beta1,beta2,eps]=ADAM_init_param(nz,nx);       
elseif m==5
    meth='NADAM';
    alfa=0.8; % step length
    % Inicializamos parámetros del método NADAM:
    [tt,Vt,St,beta1,beta2,eps]=NADAM_init_param(nz,nx);     
elseif m==6
    meth='AMSGrad';
    alfa=0.12; % step length
    % Inicializamos parámetros del método AMSGrad:
    [Vt,St,St_hat,beta1,beta2,eps]=AMSGrad_init_param(nz,nx);
elseif m==7  
    meth='RADAM';
    alfa=0.025; % step length
    % Inicializamos parámetros del método RADAM:
    [tt,Vt,St,beta1,beta2,p_inf,eps]=RADAM_init_param(nz,nx);    
elseif m==8  
    meth='SGDW';
    alfa=0.01; % step length
    lambd=0.5*alfa; % factor de regularización
    % Inicializamos parámetros del método SGDW:
    [Vt,St,beta1]=SGDW_init_param(nz,nx);
elseif m==9  
    meth='ADAMW';
    alfa=1; % step length
    lambd=0.01*alfa; % factor de regularización
    % Inicializamos parámetros del método ADAMW:
    [tt,Vt,St,beta1,beta2,eps]=ADAMW_init_param(nz,nx);
end  
    


% Dominio para grafica de la función
ax=-6;
bx=6;
x=ax:0.1:bx;

[y,gy,x_min]=func1(x); % <-- evaluamos la función en el dominio

x0=-5.6;% <--- valor inicial para minimización

% Gradiente y evaluación de la función con el valor inicial
[y0,gk1,x_min]=func1(x0);

% Evaluación de error en el valor inicial
err_xi=zeros(1,nit);
err_xi(1)=abs(x0-x_min);

figure(1)
subplot(2,1,1)
plot(x,y,'b','LineWidth',2) % <--- gráfica de la función
axis([ax  bx    min(y)  max(y)])
hold on
plot(x0,y0,'or', 'LineWidth',2) % <--- valor inicial y su valor
hold off
title('Valores de f(xi)')
xlabel('Eje x')
ylabel(' f(x)')


figure(1)
subplot(2,1,2)
plot(1,err_xi(1),'*r','LineWidth',1) % <--- error con respecto al valor inicial 
title(['Misfit con el método ',meth,' y step-lngth = ',num2str(alfa)])
xlabel('Iteraciones')
ylabel(' |x_{i} - x_{min}|')

xi=x0;
for k=1:nit-1  
    
    % Optmimizador
    if m==0
        xi = xi-alfa*gk1;
    elseif m==1
        [xi,St] = AdaGrad_METH(gk1,St,eps,alfa,xi);        
    elseif m==2
        [xi,St] = RMSProp_METH(xi,St,alfa,beta1,eps,gk1);    
    elseif m==3
        [xi,xi0,Dt,St] = ADADELTA_METH(gk1,beta1,St,Dt,eps,alfa,xi0,xi);        
    elseif m==4
        [xi,tt,Vt,St] = ADAM_METH(xi,tt,alfa,beta1,beta2,eps,Vt,St,gk1);        
    elseif m==5
        [xi,tt,Vt,St] = NADAM_METH(xi,tt,alfa,beta1,beta2,eps,Vt,St,gk1);        
    elseif m==6
        [Vt,St,St_hat,xi] = AMSGrad_METH(xi,Vt,St,St_hat,alfa,beta1,eps,beta2,gk1);        
    elseif m==7
        [xi,tt,Vt,St] = RADAM_METH(xi,tt,alfa,Vt,St,beta1,beta2,p_inf,eps,gk1);           
    elseif m==8
        [xi,Vt] = SGDW_METH(xi,alfa,beta1,lambd,Vt,gk1);
    elseif m==9
        [xi,tt,Vt,St] = ADAMW_METH(xi,tt,alfa,beta1,beta2,eps,lambd,Vt,St,gk1);
    end  
    
    
    % Evaluamos el nuevo punto y calculamos gradiente para la siguiente iteracion:
    [yi,gk1,x_min]=func1(xi);
    
    % Calculamos el error con el nuevo punto:
    err_xi(k+1)=norm(xi-x_min);
    
    figure(1)
    subplot(2,1,1)
    plot(x,y,'b','LineWidth',2) % <--- gráfica de la función      
    hold on
    plot(x0,y0,'Or', 'LineWidth',10) % <--- punto inicial y su valor
    plot(xi,yi,'Or', 'LineWidth',10) % <--- valor inicial y su valor
    hold off
    title('Valores de f(xi)')
    axis([ax  bx min(y) max(y)])

    
    subplot(2,1,2)    
    hold on 
    plot(k+1,err_xi(k+1),'.k', 'LineWidth',2)
    axis([0  nit 0 err_xi(1)])
    
    if crea_video==1
        % Vamos grabando el video: 
        ventana_actual=getframe(gcf);% gcf=get current frame
        writeVideo(my_video,ventana_actual);
    end
    
    pause(0.01)    
    
end

figure(1)
subplot(2,1,1)
hold on 
plot(x0,y0,'or', 'LineWidth',2) % <--- punto inicial y su valor
plot(xi,yi,'or','LineWidth',2) % <--- punto final y su valor

subplot(2,1,2)
hold on 
plot(err_xi,'r','LineWidth',2)

if crea_video==1    
    
    % Vamos grabando el video: 
    ventana_actual=getframe(gcf);% gcf=get current frame
    writeVideo(my_video,ventana_actual);  
    
    % Cerramos el video
    close(my_video);
end

save(['./Results_err/err_',meth],'x','y','alfa','x0','y0','xi','yi','err_xi')

