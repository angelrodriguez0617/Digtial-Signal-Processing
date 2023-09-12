% ECE 4750 
% Practice on Unit Step Response using 'filter' command.
% This code is written by Dr. Shekaramiz from UVU.
% Borrowed from Ingle and Proakis with some modification.
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
n = 0:100;
x = ones(length(n));
% Unit Step Response
y = filter(b,a,x);
stem(n,y); grid; title('Unit Step Respose');
xlabel('n'); ylabel('y[n]');