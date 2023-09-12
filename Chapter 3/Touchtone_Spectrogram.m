% ECE 4750
% Practice on Spectrogram
% This code is written by Dr. Shekaramiz from UVU.
% Ver1: 2/9/2021

% Touch Tone Signal
clc, clear; close all;
fs = 4e3;
t = 0:1/fs:0.5-1/fs;

ver = [697 770 852 941];
hor = [1209 1336 1477];

tones = [];

for k = 1:length(ver)
    for l = 1:length(hor)
        tone = sum(sin(2*pi*[ver(k);hor(l)].*t))';
        tones = [tones;tone;zeros(size(tone))];
    end
end

soundsc(tones,fs)
figure; plot(repmat(t,1,length(ver)*length(hor)*2),tones);
title('Signal in time domain'); xlabel('time (Sec)');
S = timetable(seconds(0:length(tones)-1)'/fs,tones);
figure;
    pspectrum(S,'spectrogram', ...
    'TimeResolution',0.5,'OverlapPercent',0,'Leakage',0.85)