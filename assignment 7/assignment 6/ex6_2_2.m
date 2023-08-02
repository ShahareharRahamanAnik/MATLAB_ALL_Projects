clc 
close all
format short
x=[1:.5:7];
y=[-15.997 -17.966 -19.808 -21.267 -21.813 -20.458 -15.712 -5.089 14.875 49.042 103.968 188.257 312.947];
n=length(y);
h=(x(2)-x(1)); 
Y=(y(1)+y(n));

for z=2:2:n-1
    Y=Y+4*y(z);
end

for z=3:2:n-2
    Y=Y+2*y(z);
end

Z=1/3*(h*Y);
fprintf('Simpson’s 1/3 value for the function is: \n\n')
disp(Z);

syms X
RV=int (0.003*X^6 + 2.6338e-15*X^5 -2.6521e-14*X^4 + 1.2812e-13*X^3 -3.0805e-13*X^2 -4*X -12,X,1,7);

fprintf('actual integrated  value of the function is: \n \n')
disp(double(RV))

fprintf('Error at percentage is :\n\n')
disp(double(abs(((RV-Z)/RV)*100)))

accuracy=double((100-(abs(((RV-Z)/RV)*100))))