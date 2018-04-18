%% TASK 2

clear all;
clc;
close all;

b = 1;
x = [1 2 3 4 5 6 7 8 9 10];
h = [0.2 0.3 0.2];

Y = FIRsum(x,h);
Y = filter(b,h,x);

stem(abs(Y));    
grid on;