% Método ADADELTA

function [ss,ss0,Dt,St] = ADADELTA_METH(gk1,beta1,St,Dt,eps,alfa,ss0,ss)

    delta_s=ss-ss0;  
    Dt=beta1*Dt + (1-beta1)*(delta_s.^2);
    St=beta1*St + (1-beta1)*(gk1.^2) ;
    
    % *** NO CAMBIAR EL ORDEN DE LOS SIGUIENTES RENGLONES ***
    ss0=ss;    
    ss = ss - alfa*(sqrt(Dt + eps)./sqrt(St + eps)).*gk1;  

end

