% ECE 4750
% Practice on Spectrogram
% This code is written by Dr. Shekaramiz from UVU.
% Ver1: 2/9/2021
clc, clear; close all
Example = 9;  % set 1, 2, ..., 9
% ---------------
% Example 1
% Chirp Signal
if Example == 1
    fs = 1e3;
    t = 0:1/fs:2;
    y = chirp(t,100,1,200,'quadratic');
    sound(y,fs)
    [sp,fp,tp] = pspectrum(y,fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(y,fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 2
% bat
elseif Example == 2
    [x,Fs]=audioread('bat1.wav');
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 3
% bat
elseif Example == 3
    [x,Fs]=audioread('bat2.mp3');
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 4
% bat    
elseif Example == 4
    [x,Fs]=audioread('bat3.wav');
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 5
% human voice
elseif Example == 5
    [x,Fs]=audioread('humanvoice.wav');
    x = x(20000:100000,:); % chunk of the signal
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 6
% piano
elseif Example == 6
    [x,Fs]=audioread('piano1.wav');
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 7
% piano
elseif Example == 7
    [x,Fs]=audioread('piano2.wav');
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 8
% ambulence
elseif Example == 8
    [x,Fs]=audioread('ambul1.wav');
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
% ---------------
% Example 9
% ambulence
elseif Example == 9
    [x,Fs]=audioread('ambul2.wav');
    sound(x,Fs)
    x = x(:, 1); % one channel
    [sp,fp,tp] = pspectrum(x,Fs,'spectrogram');
    mesh(tp,fp,sp)
    view(-15,60)
    xlabel('Time (s)')
    ylabel('Frequency (Hz)')
    pspectrum(x,Fs,'spectrogram','FrequencyResolution',10,'Reassign',true)
end
