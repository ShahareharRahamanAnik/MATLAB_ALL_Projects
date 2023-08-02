clc 
clear all
close all
t=-1:.001:5;
T=1;

f=1/T;
y=0;
for i=1:2:1000
    y=y+((1/i)*sin(2*pi*i*f*t));
    
end

plot(t,y)