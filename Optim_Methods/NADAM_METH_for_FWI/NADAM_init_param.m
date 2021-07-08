
% Parámetros para inicializar método NADAM


function  [tt,Vt,St,beta1,beta2,eps]=NADAM_init_param(nz,nx)

    %% parámetros del optimizador Nadam:
    tt=0;
    Vt=zeros(nz,nx);
    St=zeros(nz,nx);
    beta1=0.9;
    beta2=0.999;
    %alfa=0.000002;
    eps=1e-7;

end