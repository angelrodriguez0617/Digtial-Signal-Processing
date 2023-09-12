% ECE 4750 
% Practice on finding the output of an LTI system for an arbitraty input sequence and system's difference equation using 'filter' command.
% This code is written by Dr. Shekaramiz from UVU.
% Ver1: 2/13/2021
clc, clear; close all
% --------------------------------------------
% Example.
% The differnce equation of the LTI system is given as:
% y[n]=y[n-1]-0.9y[n-2]+x[n]

% The first step is rewiting the equation as follows.
% y[n]-y[n-1]+0.9y[n-2]=x[n]
b= 1; % Coefficients of the input
a = [ 1 -1  0.9]; %  Coefficients of the output
% define the input of unit step function and its range of interest for 'n'.
n = 0:30;
% x[n] = 4u[n]-3u[n-5]-2u[n-10]+u[n-20]
x = [4*ones(1,4),ones(1,5),-1*ones(1,11),zeros(1,11)];
% Output
y = filter(b,a,x);
figure; subplot(211); stem(n,x); ylabel('x[n]'); xlabel('n'); grid; title('Input Sequence');
subplot(212); stem(0:length(y)-1,y); ylabel('y[n]'); xlabel('n'); grid; title('Output Sequence');
xlabel('n'); ylabel('y[n]');