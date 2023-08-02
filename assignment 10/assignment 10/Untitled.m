clc
clear all
close all
format bank
x=[1 2 3 4 5];
y=[8 26 476 76 119];
p= input('enter order of equation');
A=zeros(p+1,p+1)
B=zeros(p+1,1)
for k=1:p+1
    for j=1:p+1
        A(k,j)=sum(x.^(k-+j-2));
    end
end
for k=1:p+1
    B(k,1)=sum((x.^(k-1)).*y);
end
AB=[A B]