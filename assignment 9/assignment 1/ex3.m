clc
clear all
syms x
n = 10;
y= (cos(x))^2;
D= diff(y,n)
E=subs(D,0.001)
x=1;
Rn=abs(x^n*E/factorial(n))
