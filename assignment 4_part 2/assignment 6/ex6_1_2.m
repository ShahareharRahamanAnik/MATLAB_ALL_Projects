clc 
close all
format long

%Simpson’s 1/3 Rule 
f= @ (x) x/(x^2+4);
n=4500;
h=(9-0)/n;
 y=(f(0)+f(9));
 
for z=1:2:n-1
    y=y+4*f(0+z*h);
end

for z=2:2:n-2
    y=y+2*f(0+z*h);
end

Z=h/3*y;
fprintf('Simpson’s 1/3 value for the function is: \n\n')
disp(Z)

 syms X
RV=int (X/(X^2+4),X,0,9);

fprintf('Actual integrated value of the function is: \n \n')
disp(double(RV))

fprintf('Error at percentage is :\n\n')
disp(double(abs(((RV-Z)/RV)*100)))

Accuracy=double((100-(abs(((RV-Z)/RV)*100))))
