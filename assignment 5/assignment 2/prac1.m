clc
clear all
close all
format long

f=@(x) x^3+10*x^2-2*x-10;
x=0;
x1=0;
x2=0;
while(f(x1)*f(x2)>0)
    y=f(x);
    if y>0
        x2=x;
    else
        x1=x;
    end
    x=x+1;
end
x1
x2
f(x1)
f(x2)
