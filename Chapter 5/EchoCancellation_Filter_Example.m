% ECE 4750 
% Practice on Echo cancellation using 'filter' command.
% This code is written by Dr. Shekaramiz from UVU.
% Ver1: 2/13/2021
clc, clear; close all
% --------------------------------------------
% Example.
% x[n]: Input sequece: Echo-corrupted sequence
% Filter based on the input-output relationship.
% y[n]+alpha*y[n-D]=x[n] this is for removing the noise
% alpha and D are filter parameters

[x,Fs] = audioread('humanvoice.wav');
x = x(10000:50000); % working with a chunk of signal.
soundsc(x);
pause(10)
% Generating echoed sound synthetically.
alpha = 0.8; % tune it. |alpha|<1
D = 4000; % tune it
b=1;
a=[ 1 , zeros(1,D) , alpha ];
x_echoed  = filter(b,a,x);
soundsc(x_echoed)
pause(10)
% Echo Cancellation.
% If we could figure out alpha and D experimentally.
x_remved_echo = filter(a,b,x_echoed);
soundsc(x_remved_echo)


% -----------------------------
% Excercise
% The echoed sound signal 'x_echoed2.wav' is given.
% Desing a filter that can cancel the echo and play the resulting sound.

% [x,Fs] = audioread('x_echoed2.wav');
% Ts = 1/Fs
% soundsc(x);
% pause(10)
% Generating echoed sound synthetically.
% alpha = ? % set a vaule here
% D = ?
% b=1;
% create a for loop D = 1: 1:10:100
% a = [ 1 , zeros(1,D) , alpha ];
% x_removed_echo  = filter(a,b,x_echoed);
% soundsc(x_removed_echo);
% pause(10)
% end for 