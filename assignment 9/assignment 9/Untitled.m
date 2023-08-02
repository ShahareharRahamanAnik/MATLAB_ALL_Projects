clc
A=[2 5 1; 1 (-1) 10;  13 2 3];
B=[ 33 25 40];
AB=[ A B'];
n= size(AB);
n1=n(1);
n2=n(2);
AB_corr=zeros(n1,n2);
var=zeros(1,n1);
var_old=zeros(1,n1);
err=zeros(1,n1);
for i=1:n1
    max_val=max(abs(A(i, :)));
    for j=1:n1
        if A(i,j)==max_val
            AB_corr(j, :)=AB(i,:);
        end
    end
end
max_err=5000;
while (max_err>0.001)
   
    for i= 1:n1
         var_old(i)=var(i);
        s=0;
        for j=1:n1
            if(j~=i)
                s=s+AB_corr(i,j)*var(j);
            else
                s=s;
            end
        var(i)=(AB_corr(i,n2)-s)/AB_corr(i,i);
        end
    err(i)= abs(var(i)-var_old(i));
end
max_err=max(err);
end
disp(var)