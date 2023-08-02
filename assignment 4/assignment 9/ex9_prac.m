clc
clear all
close all
A=[2 5 1;1 -1 10;13 2 3];
B=[33;25;40];
AB=[A B];
n=size(AB);
n1=n(1);
n2=n(2);
AB_corr=zeros(n1,n2);
for i=1:n1
    max_val=max(abs(A(i,:)));
    for j=1:n1
        if A(i,j)==max_val
            AB_corr(j,:)=AB(i,:);
        end 
    end
end
AB_corr;
error=zeros(1,n1);
var=zeros(1,n1);
var_old=zeros(1,n1);
max_error=100;
while(max_error>0.00001)
 for i=1:n1
    var_old(i)=var(i);
    s=0;
    for j=1:n1
        if(j~=i)the 
                s=s+AB_corr(i,j)*var(j);
        end
        var(i)=(AB_corr(i,end)-(s))/AB_corr(i,i);       %n2 or end
    end
    error(i)=abs(var(i)-var_old(i));
 end
 max_error=max(error);
e
disp(var);