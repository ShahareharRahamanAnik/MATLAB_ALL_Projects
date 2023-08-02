clear all
clc
format long
for n=4:1:11
    n=n+1
    sum=0;
x=1;
for i=0:n-1
     sum=sum+((-1)^i)*(x^(2*i))*2^(2*i)*.5/factorial(2*i);
end
Va=0.5+0.5*sum; %approximate value
Vt=(cos(x))^2; %actual value
abslt_error = abs( Vt-Va) %actual error
rel_error = (abslt_error/Vt) %relative error
end    
    
    
    
