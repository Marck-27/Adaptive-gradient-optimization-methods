% Método ADAM

function [ss,tt,Vt,St] = ADAMW_METH(ss,tt,alfa,beta1,beta2,eps,lambd,Vt,St,gk1)

    tt=tt+1;  
    Vt= beta1 * Vt +(1-beta1)*gk1 ;
    St=beta2*St + (1-beta2)*(gk1.^2);
    Vt_hat=( 1/(1-beta1^tt)  )*Vt;
    St_hat=( 1/(1-beta2^tt)  )*St;
    
    ss = ss-alfa*( Vt_hat./(sqrt(St_hat) + eps) ) - lambd*ss;

end

