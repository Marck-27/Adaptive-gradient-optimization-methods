
% Parámetros para inicializar método RMSProp


function  [St,beta1,eps]=RMSProp_init_param(nz,nx)

    %% parḿetros del método RMSProp
    beta1=0.9;
    St=zeros(nz,nx);
    eps=1e-6;
    %alfa=0.000001;

end