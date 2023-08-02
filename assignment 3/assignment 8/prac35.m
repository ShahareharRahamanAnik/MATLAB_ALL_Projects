clc
close all
clear all
format bank 
fprintf('the matrix is :')
A=[-3 2 -1 ;
     6 -6  7 ;
     3 -4 4 ];
 B=[1; 7; 6;];
 M=[ A B]
 
[m,n]=size(M);
for j= 1:m-1
    for z=2:m
        if M(j,j)==0
            t=M(j,:);
            M(j, :)=M(z,:);
            M(z, :)=t;
        end
    end
    for i=j+1:m
        M(i, :) = M(i, :)-M(j, :)*(M(i,j)/M(j ,j));
    end
end
x=zeros(1 ,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c=c+M(s,k)*x(k);
    end
    x(s)=(M(s,n)-c/M(s,s));
end
 %disp(M);
%x'
[m,n]=size (M);
for j=1: m-1
    for Z=2:m
        if M(j,j)==0
            t=M(1, :);M(1,:) = M(z,:);
            M(z, :)=t;
        end
    end
    for i = j+1:m
        M(i, :) =M(i, :) -M(j , :) * (M(i,j)/M(j,j))
    end
end
for j= m:-1:2
    for i = j-1 : -1 :1
        M(i , :)=M(i, :)-M(j, :)* (M(i,j)/M(j,j))
    end 
end
for s=1:m
    M(s , :)= M(s, :)/M(s, s);
    x(s) = M(s ,n) ;
end
fprintf('the identity matrix is:\n')
disp (M);
x' 

