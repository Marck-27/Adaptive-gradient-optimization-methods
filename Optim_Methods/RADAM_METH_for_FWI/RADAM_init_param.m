
% Parámetros para inicializar método RADAM


function  [tt,Vt,St,beta1,beta2,p_inf,eps]=RADAM_init_param(nz,nx)

    %% Parámetros método RADAM
    tt=0;
    St=zeros(nz,nx);
    Vt=zeros(nz,nx);
    beta1=0.9;
    beta2=0.6;
    p_inf=(2/(1-beta2))-1;
    eps=1e-8;
    

end