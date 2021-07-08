
% Parámetros para inicializar método SGDW

function  [Vt,St,beta1]=SGDW_init_param(nz,nx)

    %% Parámetros método SGDW    
    Vt=zeros(nz,nx);
    St=zeros(nz,nx);
    beta1=0.9;  

end