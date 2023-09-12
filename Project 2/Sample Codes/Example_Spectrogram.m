% ECE 4755
% Project 2, Example

clc, close all;
grayImage = imread('p1.png');
% Get the dimensions of the image.  
[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  grayImage = grayImage(:, :, 2); % Take green channel.
end
% Display the original gray scale image.
subplot(2, 1, 1);
imshow(grayImage, []);
fontSize = 20;
title('Original Grayscale Image', 'FontSize', fontSize, 'Interpreter', 'None');
% Set up figure properties:
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
%set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
%set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 
% Display the original gray scale image.
subplot(2, 1, 2);
Imag_F=fft2(grayImage); % uncentered FFT
Image_F_C=fftshift(log(1+abs(Imag_F))); % Centered FFT
imshow(Image_F_C,[]);
title('Spectrum Image', 'FontSize', fontSize, 'Interpreter', 'None');