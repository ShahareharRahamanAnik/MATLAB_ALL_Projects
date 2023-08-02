clc 
close all
f= @ (x) sin(x);
n=100;
h=(pi/2)/n;
 y=(f(0)+f(pi/2));
for c=1:2:n-1
    y=y+4*f(0+c*h);
end
for c=2:2:n-2
    y=y+2*f(0+c*h);
end

C=h/3*y
