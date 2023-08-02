clc
clear all
close all

A=[-3 2 -1;  6 -6 7;   3 -4 4];
b=[1;7;6];
G=[A b];
 S=size(A);
 n=S(1);
disp(G)

 t=zeros(1,n+1);
 for i=1:n 
     if G(i,i)==0
         t=G(i+1,:);
         G(i+1,:)=G(i,:);
         G(i,:)=t;
     end
 end

 for i=1:n
     
     G(i,:)=G(i,:)/G(i,i);
     for j=1:n 
         if j~=i
             G(j,:)=G(j,:)-(G(j,i)*G(i,:));
         end
     end
 end
G(:,n+1)