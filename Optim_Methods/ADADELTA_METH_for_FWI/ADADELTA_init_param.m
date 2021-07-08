
% Parámetros para inicializar método ADADELTA


function  [beta1,St,Dt,eps,ss0]=ADADELTA_init_param(nz,nx)

    beta1=0.95;
    St=zeros(nz,nx);
    Dt=zeros(nz,nx);
    eps=1e-6;
    %alfa=0.001;
    ss0=zeros(nz,nx);

end