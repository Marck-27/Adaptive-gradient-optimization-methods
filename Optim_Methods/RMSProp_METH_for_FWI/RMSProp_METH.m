% Método RMSProp

function [ss,St] = RMSProp_METH(ss,St,alfa,beta1,eps,gk1)

    St=beta1*St + (1-beta1)*(gk1.^2);    
    ss = ss - ( alfa./( sqrt(St + eps) ) ).*gk1; 

end

