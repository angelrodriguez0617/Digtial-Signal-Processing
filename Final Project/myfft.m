clc, clear; close all;

audioID = fopen('audio.bin', 'r', 'native');
audio = fread(audioID, Inf, 'int16');
fclose(audioID);

audio_dft = custom_dft(audio);
audio_idft = custom_idft(audio_dft);

N = length(audio_dft);

figure;
subplot(5, 1, 1);
plot(audio);
title("Original Audio - Input Signal");
subplot(5, 1, 2);
plot((-N/2:N/2-1), abs(fftshift(audio_dft)));
title("User-Created Custom DFT");
subplot(5, 1, 3);
plot((-N/2:N/2-1), abs(fftshift(fft(audio))));
title("FFT from MATLAB");
subplot(5, 1, 4);
plot(real(audio_idft));
title("User-Created Custom iDFT");
subplot(5, 1, 5);
plot(real(ifft(audio_dft)));
title("iFFT from MATLAB");


impulseID = fopen('impulse.bin', 'r', 'native');
impulse = fread(impulseID, Inf, 'int16');
fclose(impulseID);

impulse_dft = custom_dft(impulse);
impulse_idft = custom_idft(impulse_dft);

N = length(impulse_dft);

figure;
subplot(5, 1, 1);
plot(impulse);
title("Original Audio - Impulse Response");
subplot(5, 1, 2);
plot((-N/2:N/2-1), abs(fftshift(impulse_dft)));
title("User-Created Custom DFT");
subplot(5, 1, 3);
plot((-N/2:N/2-1), abs(fftshift(fft(impulse))));
title("FFT from MATLAB");
subplot(5, 1, 4);
plot(real(impulse_idft));
title("User-Created Custom iDFT");
subplot(5, 1, 5);
plot(real(ifft(impulse_dft)));
title("iFFT from MATLAB");


function dft_return = custom_dft(signal)
    N = length(signal);
    W_nk = (exp(-2j*pi / N).^(0:N-1)).^((0:N-1)');
    dft_return = sum(W_nk.*signal);
end

function idft_return = custom_idft(signal)
    N = length(signal);
    W_nk = (exp(2j*pi / N).^(0:N-1)).^((0:N-1)');
    idft_return = sum(W_nk.*signal, 2)./N;
end
