function [f,gf,x_min]=func2(x)   
   
   E=3*(x-pi/2);
   F=15*x;

   f=0.1*(x.^2) - sin(E)-0.5*cos(F)+1.5;
   
   gf = 0.2*x - 3*sin(E) + 7.5*sin(F);
   
   x_min = 0;    

end