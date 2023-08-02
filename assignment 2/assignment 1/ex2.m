clc
clear all
error = 100;
x=1;
i=0;
sum=0;
Vt=(cos(x))^2;
while(error>10^-12)
    sum=sum+((-1)^i)*(x^(2*i))*2^(2*i)/factorial(2*i);
    i=i+1;
    Va=0.5+0.5*sum;
    error=abs(Vt-Va);
end
disp(i)