clc
clear all
close all
format long
f=@(x) exp(-x)-x ;
D= @(x) -exp(-x)-1 ;
x=3;
x1=0;
E=100;
acc=10^-9;
count=0;
while (E>acc)
    x1=x-(f(x) / D(x));
    E=abs(x-x1);
        x=x1;
       count=count+1;
end
f(x)
x1
x2 = fzero(f,x)
x3=fsolve(f,x)
count