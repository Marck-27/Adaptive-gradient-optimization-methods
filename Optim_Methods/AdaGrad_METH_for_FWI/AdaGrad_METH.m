% Método AdaGrad

function [ss,St] = AdaGrad_METH(gk1,St,eps,alfa,ss)

    St = St + (gk1.^2);
    
    ss = ss- ( alfa./(sqrt(St + eps)) ).*gk1;

end

