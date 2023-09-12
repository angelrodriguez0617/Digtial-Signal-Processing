% ECE 4750 
% Practice on Covolution.
% This code is written by Dr. Shekaramiz from UVU.
% Borrowed from Ingle and Proakis with some modification.
% Ver1: 2/13/2021
clc, clear; close all
% --------------------------------------------
% Example 1.
 % x[n]=3*delta[n]+11*delta[n-1]+7*delta[n-2]-delta[n-4]+4*delta[n-5]+2*delta[n-6]
% Filter (Impulse Response): 
% h[n]=2*delta[n]+3*delta[n-1]-5*delta[n-3]+2*delta[n-4]+delta[n-5]
x=[ 3 11 7 0 -1 4 2];
h=[ 2 3 0 -5 2 1];
y=conv(x,h);
disp(y);
figure; subplot(311); stem(x,'LineWidth',2); xlabel('n');ylabel('x[n]'); grid
subplot(312); stem(h,'LineWidth',2); xlabel('n');ylabel('h[n]'); grid
subplot(313); stem(y,'LineWidth',2); xlabel('n');ylabel('y[n]'); grid
% --------------------------------------------
% Example 2.
% Case: The input sequence and the filter sequence start at different times.
% Input: 
% x[n]=3*delta[n+3]+11*delta[n+2]+7*delta[n+1]-delta[n-1]+4*delta[n-2]+2*delta[n-3]
% Filter (Impulse Response): 
% h[n]=2*delta[n+1]+3*delta[n]-5*delta[n-2]+2*delta[n-3]+delta[n-4]

% Find and plot the output of using convolution.
% Note: Becareful about the time samples of the output.
x=[ 3 11 7 0 -1 4 2];
h=[ 2 3 0 -5 2 1];
n_x = -3: 3;
n_h = -1: 4;
n_y_begin = n_x(1)+n_h(1);
n_y_end = length(x)+length(h)+n_y_begin-2;
n_y = n_y_begin : n_y_end;
y=conv(x,h);
disp(y);
figure; subplot(311); stem(n_x,x,'LineWidth',2); xlabel('n');ylabel('x[n]'); grid
subplot(312); stem(n_h,h,'LineWidth',2); xlabel('n');ylabel('h[n]'); grid
subplot(313); stem(n_y,y,'LineWidth',2); xlabel('n');ylabel('y[n]'); grid
% --------------------------------------------
% Example 3.
% Case: The input sequence and the filter sequence start at different times.
% Input: 
% x[n]=delta[n+2]+delta[n+1]+delta[n-1]-delta[n-2]
% Filter (Impulse Response): 
% h[n]=u[n]-u[n-5]
% = delta[n]+delta[n-1]+delta[n-2]+delta[n-3]+delta[n-4]

% Find and plot the output of using convolution.
% Note: Becareful about the time samples of the output.
x=[ 1 1 0 1 -1];
h=[ 1 1 1 1 1];
n_x = -2: 2;
n_h = 0: 4;
n_y_begin = n_x(1)+n_h(1);
n_y_end = length(x)+length(h)+n_y_begin-2;
n_y = n_y_begin : n_y_end;
y=conv(x,h);
disp(y);
figure; subplot(311); stem(n_x,x,'LineWidth',2); xlabel('n');ylabel('x[n]'); grid
subplot(312); stem(n_h,h,'LineWidth',2); xlabel('n');ylabel('h[n]'); grid
subplot(313); stem(n_y,y,'LineWidth',2); xlabel('n');ylabel('y[n]'); grid
% -------------------------------
% Class Practice 1:
% Input: 
% x[n]=delta[n+4]+5*delta[n+2]+delta[n]-delta[n-1]+2*delta[n-2]
% Filter (Impulse Response): 
% h[n]=delta[n+1]+2*delta[n]-2*delta[n-1]+2*delta[n-3]
% Find and plot the output of using convolution. Also, plot the 
% input sequence and the impulse sequence using 'stem' function.
% Use subplot to show all the plots in the same figure.






% -------------------------------
% Class Practice 2:
% Create a function that computes and plots the convolution of 
% any finte input sequence and any finite impulse response.
% The inputs should be (x,h,n_x,n_h). Refer to the above examples.


