clc
clear all
close all
clc
format long
f = @(x)   exp(-x)-x;
x = 0;
x1 = 0;
x2 = 0;
while (f(x2) * f(x1)>0)
    y=f(x);
    if y>0
        x1=x;
    else
        x2=x;
    end
    x=x+1;
end
x1;
x2;
f(x1)
f(x2)
count=0;
acc=10^-10;
while (abs(x1-x2)>acc)
    x3 = x1-((f(x1)/(f(x1)-f(x2)))*(x1 - x2));
    if (f(x3) * f(x2) > 0)
        x2 = x3;
    else
        x1 = x3;
    end
    count = count + 1;
end
x1;
x2;
x3
count