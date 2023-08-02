clc
clear all;
close all;
x=[1:7];
y=[-15.997 -19.808 -21.813 -15.712 14.875 103.968 312.947];
format short
%y= 0.00. x^6 -4x -12;
%yp= 0.003*6^x^5-4
%yp2=0.003*6*5x^4
d=length(x);
dd=d-1;
table= zeros(d,d+1);
table(:,1)=x;
table(:,2)=y;
dd=d-1;
for i=3:d+1
    for j=d:-1:i-1
        table(j,i)=table(j,i-1)-table(j-1,i-1);
    end
end
difi=0;
table
for i=1:6
   
    difi=difi+ table(7,i+2)/i;                                              
end
table;
difi
dif2= table(7,4)+table(7,5)+(11/12)*table(7,6)+(5/6)*table(7,7)+0.7611*table(7,8);
dif2