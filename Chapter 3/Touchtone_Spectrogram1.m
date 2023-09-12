
% ECE 4750
% Practice on Spectrogram
% This code is written by Dr. Shekaramiz from UVU.
% Ver1: 2/9/2021

% Touch Tone
clc, clear; close all;
Fs = 32768;
t = 0 : 1/Fs : 0.25;
fr = [ 697 , 770 , 852 , 942];
fc = [ 1209 , 1336 , 1477];
for m = 1:4
    for n = 1:3
        y1 = sin(2*pi*fr(m)*t);
        y2 = sin(2*pi*fc(n)*t);
        y = 0.5*(y1+y2);
        sound(y,Fs);
        pause(2);
        y = double(y);
        Len_y = length(y);
        p = abs(fft(y));
        f = (Fs/Len_y)*(1:Len_y);
        figure; subplot(311); plot(t,y); grid 
        title('Signal/tone'); ylabel('y(t)'); xlabel('t(sec)');
        subplot(312); plot(f,p); title('FFT of Signal'); 
        ylabel('|Y(jw)|'); xlabel('f(Hz)'); grid;
        axis([0 2000 0 2000]);
        subplot(313);
        pspectrum(y,Fs,'spectrogram', ...
'FrequencyLimits',[0 2000],'TimeResolution',0.1)
        figure; pspectrum(y,Fs,'spectrogram', ...
'FrequencyLimits',[0 2000],'TimeResolution',0.1)
keyboard
    end
end