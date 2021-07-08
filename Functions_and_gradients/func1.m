function [f,gf,x_min]=func1(x)   
    
      
    k=3; % <--- curvatura
    
    a=10; % <--- amplitud de la función periódica    
    w=5; %<--- frecuencia
    xt=pi/2; %<--- desface
    
   
    E=w*(x-xt);
    
    f = a*sin(E) + k*(x.^2) ; % <--- funcion a minimizar
    
    gf =  a*w*cos(E) + 2*k*x ; % <--- gradiente   
    
    x_min = 0; % <--- minimo global    

end