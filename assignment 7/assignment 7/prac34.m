clc
close all
clear all
t=0:0.001:2;
h=0.001;
T=2;
k=1000;
N=length(t);
f=zeros(N,1);
f(1:(N+1)/2) = 2;
w=(2*pi)/T;
A=zeros(k,1);
B=zeros(k,1);
A0=(1/N)*sum(f);
for n=1:k
    y=f' .*sin(n*w*t);
    B(n)=y(1) + y(N);
for i=2:N-1
    B(n)=B(n)+2*y(i);
end
     B(n)=B(n)*h/2;
    A(n)=y(1)+y(N);
    for j=2:N-1
        A(n)=B(n)+2*y(j);
    end
    A(n)=A(n)*h/2;
end
f=A0;
for n=1 :k
    f = f + B(n) * sin(n * w * t) + A(n) * cos(n * w * t);
end
plot(t, f)