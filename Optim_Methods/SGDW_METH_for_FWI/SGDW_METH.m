% Método SGDW

function [ss,Vt] = SGDW_METH(ss,alfa,beta1,lambd,Vt,gk1)

    Vt = beta1*Vt + (1-beta1)*gk1;
    ss = ss - alfa*Vt - lambd*Vt;

end