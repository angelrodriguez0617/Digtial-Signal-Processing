% ECE 4750
% Practice on Impulse Response.
% This code is written by Dr. Shekaramiz from UVU.
% Ver1: 2/12/2021
clc, clear, close all;
[y1,Fs1] = audioread('humanvoice.wav');
y1 = y1(1:100000,:);
soundsc(y1)
pause(30)
[h,~] = audioread('IR.wav');
h = h(:,1);
soundsc(h)
pause(10)
z= conv(y1,h);
soundsc(z)

pause(15)
[y2,Fs2] = audioread('STRANGEBOX-2.wav');
y2 = y2(:,1);
soundsc(y2)
pause(10)
z= conv(y1,y2);
soundsc(z)
pause(30)


[y2,Fs2] = audioread('SmallDrumRoom.wav');
y2 = y2(:,1);
soundsc(y2)
z= conv(y1,y2);
soundsc(z)
audiowrite('x_echoed.wav',z,44100);

