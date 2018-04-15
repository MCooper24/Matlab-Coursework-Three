clear all;
clc;
close all;

k = 0;
h = [0.2, 0.3, 0.2];
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

n = [0:1:9];

Y = FIRsum(x,h);