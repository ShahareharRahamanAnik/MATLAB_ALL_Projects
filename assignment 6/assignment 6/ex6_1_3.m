clc 
close all
format long

% Simpson’s 3/8 Rule
f= @(x) x/(x^2+4);
n=4500;
h=(9-0)/n;
 y=(f(0)+f(9));

 for z=1:3:n-1
    y=y+3*f(0+z*h);
 end 
 for z=2:3:n-2
    y=y+3*f(0+z*h);
 end 
 for z=3:3:n-3
    y=y+2*f(0+z*h);
end

Z=3/8*h*y;
fprintf('Simpson’s 3/8 value for the function is: \n\n')
disp(Z)

 syms X
RV=int (X/(X^2+4),X,0,9);

fprintf('Actual integrated value of the function is: \n \n')
disp(double(RV))

fprintf('Error at percentage is :\n\n')
disp(double(abs(((RV-Z)/RV)*100)))

Accuracy=double((100-(abs(((RV-Z)/RV)*100))))