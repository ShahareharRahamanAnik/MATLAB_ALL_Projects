clc 
close all
format long
           
% Trapezoid Method
f= @ (x) x/(x^2+4); 
n=4500; %n=1000; n=100;
h=(9-0)/n;
 y= .5 * (f(0)+f(9));
 
for z=1:n-1
    y=y+2*f(0+z*h);
end

Z=h/2*y;
fprintf('Trapezoidal value for the function is: \n\n')
disp(Z);

syms X
RV=int (X/(X^2+4),X,0,9);

fprintf('actual integrated  value of the function is: \n \n')
disp(double(RV))

fprintf('Error at percentage is :\n\n')
disp(double(abs(((RV-Z)/RV)*100)))

accuracy=double((100-(abs(((RV-Z)/RV)*100))))