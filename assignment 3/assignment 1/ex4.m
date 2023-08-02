clc
clear all
close all
format long;
n = 0;
Rn = 100;
syms x;
f = (cos(x))^2;
while(Rn > 10^-12)
    D = diff(f ,n);
    E = subs(D, .001);
    x = 1;
    Rn = abs(x^n * E / factorial(n));
    n = n + 1;
end
display(n)