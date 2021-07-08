
% Parámetros para inicializar método SARAH


function  [b,beta1]=SARAH_init_param()

    %% Parámetros del método SARAH
    b=1;
    beta1=0.999;
    %alfa_max=0.0000001;% 'Step Length constante' para bajas frecuencias
    %alfa_min=0.00000001;% 'Step Length constante' para altas frecuencias
    %L=1000; % Entre más grande, el 'Step Length' es más pequeño
    %N=72.309;%49.749;%20.242; % Entre más pequeño el 'Step Length'cambia más
    %alfa=alfa_it(nit,N,L);% 'Step Length variable'

end