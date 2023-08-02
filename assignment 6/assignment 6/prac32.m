close all 
clc 
format short
Z=191;
syms X
RV=int (0.003*X^6 + 2.6338e-15*X^5 -2.6521e-14*X^4 + 1.2812e-13*X^3 -3.0805e-13*X^2 -4*X -12,X,1,7);
fprintf('actual intregrated  value of the function is: \n \n')
disp(double(RV))
fprintf('Error percentage is :\n\n')
disp(double(abs(((RV-Z)/RV)*100)))
accuracy=double((100-error))

