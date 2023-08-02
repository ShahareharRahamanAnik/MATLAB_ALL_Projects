clc 
close all
format short
f= @ (x) sin(x);
n=100;
h=(pi/2)/n;
 y=(f(0)+f(pi/2));

 for c=2:3:n-1
    y=y+3*f(0+c*h);
 end
 
 for c=3:3:n-1
    y=y+3*f(0+c*h);
 end
 
 for c=4:3:n-3
    y=y+2*f(0+c*h);
end


C=3/8*h*y