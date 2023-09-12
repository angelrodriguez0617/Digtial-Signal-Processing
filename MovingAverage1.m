% ECE 4750 (DSP)
% Moving Average
clc, close all; clear;
% Ex.
x = -2+binornd(5,0.6,1,10);
subplot(311); stem(x,'LineWidth',2); grid; ylabel('x[n]');
x_n_1 = [ 0 , x(1:end-1)];
subplot(312); stem(x_n_1,'LineWidth',2); grid; ylabel('x[n-1]');
y = 1/2 * x + 1/2 * x_n_1;
subplot(313); stem(y,'LineWidth',2); grid;
ylabel('y[n]=1/2x[n]+1/2x[n-1]');

