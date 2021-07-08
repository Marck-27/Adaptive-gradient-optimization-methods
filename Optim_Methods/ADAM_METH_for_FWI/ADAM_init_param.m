
% Parámetros para inicializar método ADAM


function  [tt,Vt,St,beta1,beta2,eps]=ADAM_init_param(nz,nx)

    %% Parámetros método ADAM
    tt=0;
    Vt=zeros(nz,nx);
    St=zeros(nz,nx);
    beta1=0.9;
    beta2=0.999;
    %alfa=0.00001;% 'Step Length constante'
    eps=1e-8;

end