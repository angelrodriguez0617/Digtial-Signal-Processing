% ECE 4755 Project 4: Touch Tone
% Part 3

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
        y = double(y);
        Len_y = length(y);
        p = abs(fft(y));
        f = (Fs/Len_y)*(1:Len_y);       
    end
end
% ---------------------------
% Problem 4
Z = [];
Temp = [];
for h = 1:8
    m = randperm(4);
    m = m(1);
    n = randperm(3);
    n = n(1);
    y1_t = sin(2*pi*fr(m)*t);
    y2_t= sin(2*pi*fc(n)*t);
    y_t = 0.5*(y1_t+y2_t);
    Z = [Z,zeros(1,20000), y_t];
    Temp = [Temp, [m ; n]];
end
disp(Temp);
sound(Z,Fs)
Z = double(Z);
Len_Z = length(Z);
tt = (1:Len_Z)/Fs;
p = abs(fft(Z));
f = (Fs/Len_Z)*(1:Len_Z);
figure; subplot(211); plot(tt,Z); grid 
title('Signal'); ylabel('y(t)'); xlabel('t(sec)');
subplot(212); plot(f,p); title('FFT of Signal'); 
ylabel('|Y(jw)|'); xlabel('f(Hz)'); grid;
axis([0 2000 0 2000]);
figure;
pspectrum(Z,Fs,'spectrogram', ...
'FrequencyLimits',[0 2000],'TimeResolution',0.1)
% -------------------------------
% This is how the noisy signal was generated. You can uncomment this
% section and see the figures. Since this was generated randomly, you will
% get the same signal Test2.wav as is given to you in the porject.
% pause(10)
% Z = Z+randn(size(Z));
% soundsc(Z,Fs)
% Z = double(Z);
% Len_Z = length(Z);
% tt = (1:Len_Z)/Fs;
% p = abs(fft(Z));
% f = (Fs/Len_Z)*(1:Len_Z);
% figure; subplot(211); plot(tt,Z); grid 
% title('Signal'); ylabel('y(t)'); xlabel('t(sec)');
% subplot(212); plot(f,p); title('FFT of Signal'); 
% ylabel('|Y(jw)|'); xlabel('f(Hz)'); grid;
% axis([0 2000 0 2000]);
% figure;
% pspectrum(Z,Fs,'spectrogram', ...
% 'FrequencyLimits',[0 2000],'TimeResolution',0.1)
% audiowrite('Test2.wav',Z,Fs)
