% clc
% clear all
close all
x=[1:8]
y=[1 28 64 43 70 95 127 149] 
X=2.8                         %required value
d=length(y);             %number of  value 
Y=0;

for i=1:d
    prod =1;
   
    for j=1:d
        if j~=i                %not equal sing "~="
            prod=prod*(X-x(j))/(x(i)-x(j));
        end
        
    end
    Y=Y+y(i)*prod;     %sum of full product
end

Y                                   %value for X



