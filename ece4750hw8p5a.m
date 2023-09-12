clc, clear; close all;

n = -20:10:100; % n is between -20 and 100 with step sizes of 10
b = 1;  %found from h{n}
a = [1 -1 0.9];

[h,t] = impz(b,a,n);

figure; stem(t,h); title('Impulse Response'); xlabel('n'); grid;