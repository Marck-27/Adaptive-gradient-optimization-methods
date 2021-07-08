% se deben correr todos los metodos para poder cargar los resultados
clear; close all; clc;

% load results AdaGrad:
load('./Results_err/err_AdaGrad');
alfa_AdaGrad=alfa;
xi_AdaGrad=xi;
yi_AdaGrad=yi;
err_AdaGrad=err_xi;

% load results RMSProp:
load('./Results_err/err_RMSProp');
alfa_RMSProp=alfa;
xi_RMSProp=xi;
yi_RMSProp=yi;
err_RMSProp=err_xi;

% load results Adadelta:
load('./Results_err/err_Adadelta');
alfa_Adadelta=alfa;
xi_Adadelta=xi;
yi_Adadelta=yi;
err_Adadelta=err_xi;

% load results ADAM:
load('./Results_err/err_ADAM');
alfa_ADAM=alfa;
xi_ADAM=xi;
yi_ADAM=yi;
err_ADAM=err_xi;

% load results NADAM:
load('./Results_err/err_NADAM');
alfa_NADAM=alfa;
xi_NADAM=xi;
yi_NADAM=yi;
err_NADAM=err_xi;

% load results AMSGrad:
load('./Results_err/err_AMSGrad');
alfa_AMSGrad=alfa;
xi_AMSGrad=xi;
yi_AMSGrad=yi;
err_AMSGrad=err_xi;

% load results RADAM:
load('./Results_err/err_RADAM');
alfa_RADAM=alfa;
xi_RADAM=xi;
yi_RADAM=yi;
err_RADAM=err_xi;

% load results Newton:
load('./Results_err/err_Newton');
alfa_Newton=alfa;
xi_Newton=xi;
yi_Newton=yi;
err_Newton=err_xi;

%% Graficos

figure(1)
plot(x,y,'b','LineWidth',3)
hold on
plot(x0,y0,'*r','LineWidth',6) % <--- valor inicial

%color_Newton = [0.7 0.3 0];
color_Adagrad = [0 0 0];
color_RMSProp = [0.1 0.5 1];
color_Adadelta = [0 0.5 0];
color_ADAM = [0 0 1];
color_NADAM = [1 0 0];
color_AMSGrad = [0 0.7 0.1];
color_RADAM = [1 0.3 0];


%plot(xi_Newton,yi_Newton,    '*','LineWidth',10,'color',color_Newton)% <--- minimo con Newton
plot(xi_AdaGrad,yi_AdaGrad,    'o','LineWidth',10,'color',color_Adagrad)% <--- minimo con AdaGrad
plot(xi_RMSProp,yi_RMSProp,    'x','LineWidth',10,'color',color_RMSProp)% <--- minimo con RMSProp
plot(xi_Adadelta,yi_Adadelta,  '*','LineWidth',10,'color',color_Adadelta)% <--- minimo con Adadelta
plot(xi_ADAM,yi_ADAM,          'o','LineWidth',10,'color',color_ADAM)% <--- minimo con ADAM
plot(xi_NADAM,yi_NADAM,        'x','LineWidth',10,'color',color_NADAM)% <--- minimo con NADAM
plot(xi_AMSGrad,yi_AMSGrad,    '*','LineWidth',10,'color',color_AMSGrad)% <--- minimo con AMSGrad
plot(xi_RADAM,yi_RADAM,          'o','LineWidth',10,'color',color_RADAM)% <--- minimo con RADAM

xlabel('x'); ylabel('f(x)')
title('Función a minimizar')
grid on

figure(2)
hold on

%plot(err_Newton,       '--','LineWidth',3,'color',color_Newton) %<--- curva de error con Newton
plot(err_AdaGrad,       'o-','LineWidth',3,'color',color_Adagrad) %<--- curva de error con AdaGrad
plot(err_RMSProp,       '-','LineWidth',3,'color',color_RMSProp) %<--- curva de error con RMSProp
plot(err_Adadelta,      'x-','LineWidth',3,'color',color_Adadelta) %<--- curva de error con Adadelta
plot(err_ADAM,          's-','LineWidth',3,'color',color_ADAM) %<--- curva de error con ADAM
plot(err_NADAM,         '>-','LineWidth',3,'color',color_NADAM) %<--- curva de error con NADAM
plot(err_AMSGrad,       '*-','LineWidth',3,'color',color_AMSGrad) %<--- curva de error con AMSGrad
plot(err_RADAM,         '-.','LineWidth',3,'color',color_RADAM) %<--- curva de error con RADAM

xlabel('No. Iteraciones'); ylabel('|x_{i} - x_{min}|')
title('Curva de error')
axis([1, 100 , 0, 6])
grid on
legend('AdaGrad','RMSProp','Adadelta','ADAM','NADAM','AMSGrad','RADAM')

