
% Parámetros para inicializar método AdaGrad


function  [St,eps]=AdaGrad_init_param(nz,nx)

    St=zeros(nz,nx);
    %alfa=0.00001;% 'Step Length constante'
    eps=1e-7;

end