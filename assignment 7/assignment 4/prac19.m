close all
clear all
clc
format long
x=[1 :8 ];
Xinput= 7.7;
y=[1; 28; 64; 43; 70; 95; 127; 149;];
d=length(x);
table=zeros(d,d+1);
table(:,1)=x;
table(:,2)=y;
table;

for i=3:d+1
    for j=d:-1:i-1
        table(j,i)=table(j,i-1)-table(j-1,i-1);
    end
end
table

h=x(2)-x(1);
p=(Xinput-x(d))/h
Y=y(d);
for i=1:d-1
    prod=1;
    for j=1:i
        prod=prod *(p+(j-1));
    end
    Y=Y+prod*table(d,i+2)/factorial(i);
end
 Y

    
        
        
