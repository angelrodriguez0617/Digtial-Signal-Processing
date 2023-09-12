% Program to collect a sample of values after applying the FFT function of
% Matlab
clc, clear; close all;

x = [
21061
-3624
7564
19130
27641
15609
-21215 
-6180
28536
27319
-5880
25795
-28972 
-9642
20521
-32119]

FFT_of_x = ((fft(x)))
IFFT_of_FFT_of_x = real(ifft(FFT_of_x)) % Should equal original array.