clc 
close all
format long
x=[1:.5:7];
y=[-15.997 -17.966 -19.808 -21.267 -21.813 -20.458 -15.712 -5.089 14.875 49.042 103.968 188.257 312.947];
n=length(y);
h=(x(2)-x(1));
%Y=.5*(y(1)+y(n));
Y=0;
for c=2:n-1
    Y=Y+2*(y(c));
end

C=h*5*(Y+y(1)+y(n))
