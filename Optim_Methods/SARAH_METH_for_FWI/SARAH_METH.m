% Método SARAH

function [ss,gk1_0,Vt_hat] = SARAH_METH(it,ss,alfa,b,beta1,gk1,Vt_hat,gk1_0)

    if it==1 || nargin==6
        % sólo para la primer iteración o cuando s'olo entran 7 argumentos 
        Vt_hat = 1/b * gk1;
        ss = ss - alfa*Vt_hat;    
        gk1_0=gk1;% guardamos gradiente para la siguiente iteración
    else        
        Vt_hat = beta1*Vt_hat + beta1*(gk1 - gk1_0) + (1-beta1)*gk1;
        ss = ss - alfa*Vt_hat;
        gk1_0=gk1;% guardamos gradiente para la siguiente iteración
    end
   

end

