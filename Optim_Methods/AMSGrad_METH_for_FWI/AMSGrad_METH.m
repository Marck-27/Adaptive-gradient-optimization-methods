% Método AMSGrad

function [Vt,St,St_hat,ss] = AMSGrad_METH(ss,Vt,St,St_hat,alfa,beta1,eps,beta2,gk1)

    %tt=tt+1; 
    
    %alfa=alfa/sqrt(tt);% sucesión de 'step length'
    %beta1=beta1-bk;% sucesión de 'beta1'
    
    Vt=beta1*Vt + (1-beta1)*gk1 ;
    St=beta2*St + (1-beta2)*(gk1.^2);    
    St_hat=max(St_hat,St);%max( St_hat, norm(St,inf) );
    
    ss = ss - ( alfa./( sqrt(St_hat) + eps ) ).*Vt; 
end

