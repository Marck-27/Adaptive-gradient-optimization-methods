
% Parámetros para inicializar método AMSGrad


function  [Vt,St,St_hat,beta1,beta2,eps]=AMSGrad_init_param(nz,nx)

    %% parámetros del método AMSGrad:
    Vt=zeros(nz,nx);
    St=zeros(nz,nx);
    St_hat=zeros(nz,nx);
    beta1=0.9;
    beta2=0.999;
    %alfa=0.000001;
    eps=1e-7;

end