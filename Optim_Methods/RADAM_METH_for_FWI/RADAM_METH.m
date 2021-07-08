% Método ADAM

function [ss,tt,Vt,St] = RADAM_METH(ss,tt,alfa,Vt,St,beta1,beta2,p_inf,eps,gk1)

    tt = tt + 1;
    
    Vt = 1/beta2*Vt + (1-beta2)*(gk1.^2);
    St = beta1*St + (1-beta1)*gk1;
    St_hat=St./(1-beta1^tt);   
    
    pt = p_inf - 2*tt*((beta2^tt)/(1-beta2^tt));      
    
    if pt > 4 
        lr= sqrt( (1-beta2^tt)./(Vt +eps) );       
        rt=sqrt( ( (pt-4)*(pt-2)*p_inf )/( (p_inf-4)*(p_inf-2)*pt ) ); 
        ss = ss - alfa*rt*St_hat*lr;
    else   
        ss = ss - alfa*St_hat;                
    end    
    
    

end

