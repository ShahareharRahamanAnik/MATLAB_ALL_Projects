clear all
close all
clc
format bank;
x=1:.5:7;
y=[-15.997 -17.966 -19.808 -21.267 -21.813 -20.458 -15.712 -5.089 14.875 49.042 103.968 188.257 312.947];

pp=spline(x,y)
plot(x,y)