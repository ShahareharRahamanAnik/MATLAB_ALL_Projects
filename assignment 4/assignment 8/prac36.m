clc
clear all
close all
format bank

A=[-3 2 -1;6 -6 7; 3 -4 4];
B=[1 7 6]';
G=[A B];
s=size(A);
n=s(1);
disp(G)


        for i=1:n
            G(i,:)=G(i,:)/G(i,i);
            disp(G);
            for j=1:n
                if(i~=j)
                    G(j , :)=G(j , :)-(G(j , i)*G(i , :));
                end
            end
            disp(G);
        end
    
        x=zeros(1,n);
        x=G(: ,n+1)
         