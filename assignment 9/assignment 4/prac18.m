close all
clear all
clc
format short
x=[1 2 3 4 5 6 7 8];
xx= 2.8;
y=[1 28 64 43 70 95 127 149;];
d=length(x);
table=zeros(d,d+1);
table(:,1)=x;
table(:,2)=y;
table;
dd=d-1;
for i=3:d+1
    for j=1:dd
        table(j,i)=table(j+1,i-1)-table(j,i-1);
    end
    dd=dd-1;
end
table
h=x(2)-x(1);
p=(xx-x(1))/h;
f=y(1);
for i=1:d-1
    prod=1;
    for j=1:i
        prod=prod *(p-(j-1));
    end
    f=f+prod*table(1,i+2)/factorial(i);
end
format long
f

    
        
        
