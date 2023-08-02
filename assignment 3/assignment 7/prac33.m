clc
close all
clear all
t=0:0.01:2;
h=0.01;
T=2;
N=length(t);
f=0*t;
f(N/4:N/2)=4*(1:N/4+1)/N;
f(N/2+1:3*N/4)=1-4*(0:N/4-1)/N;

% f=zeros(N,1);
%plot(t,f);
% i=0;
% j=0;
% for i=0:0.01:2
%     for j=0:0.01:i
%         f(j:(N+1)/2)=1
%     end
% end
plot(t,f);