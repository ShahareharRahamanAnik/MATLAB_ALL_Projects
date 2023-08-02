clear all
close all
clc
t=0:0.001:3;
h=0.001;
T=3;
coff=100; % 10, 50 & 100
N = length(t);
f = zeros(N,1);
for i=1:N
if i<=(N-1)/4
f(i) = 3;
elseif i>(N-1)/4 && i<=3*(N-1)/4
f(i) = -3;
elseif i>3*(N-11)/4 && i<=N
f(i) = 3;
end
end
w = 2*pi/T;
A = zeros(coff,1);
B = zeros(coff,1);
A0 = (1/N)*sum(f);
for n=1:coff
y = f'.*cos(n*w*t);
A(n) = y(1) + y(N);
sum1=0;
sum2=0;
i=1;
for j=2:N-1
if rem(i,2)==1
sum1=sum1+y(j);
else
sum2=sum2+y(j);
end
i=i+1;
end
A(n) = A(n) + 2*sum2 + 4*sum1;
A(n) = A(n)*(h/3);
y = f'.*sin(n*w*t);
B(n) = y(1) + y(N);
sum1=0;
sum2=0;
i=1;
for j=2:N-1
if rem(i,2)==1
sum1=sum1+y(j);
else
sum2=sum2+y(j);
end
i=i+1;
end
B(n) = B(n) + 2*sum2 + 4*sum1;
B(n) = B(n)*(h/3);
end
A = (2/T)*A;
B = (2/T)*B;
sum3 = A0;
for n=1:coff
sum3 = sum3 + B(n)*sin(n*w*t) + A(n)*cos(n*w*t);
end
sum4 = repmat(sum3,1,5) ;
t = 1:length(sum4) ;
plot(t,sum4);