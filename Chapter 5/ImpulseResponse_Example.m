% ECE 4750 
% Practice on Impulse Response.
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
% define the range of interest for 'n'.
n = -20:100;
% Impulse Response
h = impz(b,a,n);
stem(n,h); grid; title('Impulse Respose');
xlabel('n'); ylabel('h[n]');