% ECE 4755
% Project 2

clc, close all;
grayImage1 = imread('p1.png');
grayImage2 = imread('p1_2.png');
grayImage3 = imread('p1_3.png');
grayImage4 = imread('p1_4.png');
grayImage5 = imread('p1_5.png');
grayImage6 = imread('p1_6.png');
grayImage7 = imread('p1_7.png');
grayImage8 = imread('p1_8.png');
% Get the dimensions of the image.  
[rows, columns, numberOfColorBands] = size(grayImage2);
% if numberOfColorBands > 1
%   % It's not really gray scale like we expected - it's color.
%   % Convert it to gray scale by taking only the green channel.
%   grayImage2 = grayImage2(:, :, 1); % Take green channel.
% end
grayImage1 = grayImage1(:, :, 1); % Take green channel.
grayImage2 = grayImage2(:, :, 1); % Take green channel.
grayImage3 = grayImage3(:, :, 1); % Take green channel.
grayImage4 = grayImage4(:, :, 1); % Take green channel.
grayImage5 = grayImage5(:, :, 1); % Take green channel.
grayImage6 = grayImage6(:, :, 1); % Take green channel.
grayImage7 = grayImage7(:, :, 1); % Take green channel.
grayImage8 = grayImage8(:, :, 1); % Take green channel.



% Display the original gray scale image.
% subplot(2, 1, 1);
% imshow(grayImage, []);
% imshow(grayImage3, []);
fontSize = 20;
% title('Original Grayscale Image', 'FontSize', fontSize, 'Interpreter', 'None');
% Set up figure properties:
% Enlarge figure to full screen.
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
%set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
%set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 
% Display the original gray scale image.

% subplot(2, 1, 2);
% Imag_F=fft2(grayImage); % uncentered FFT
% Image_F_C=fftshift(log(1+abs(Imag_F))); % Centered FFT
% imshow(Image_F_C,[]);

% title('Spectrum Image', 'FontSize', fontSize, 'Interpreter', 'None');
% Recons = [];
% for g = 1 : size(grayImage,2)
%     Recons = [Recons, movmean(grayImage(:,g),[10,1])];
%     Z=Recons;
% end
% figure; imshow(Recons,[])
% for h=1:5
%     for g = 1 : size(grayImage,2)
%     Recons(:,g) = movmean(Recons(:,g),[10,1]);
%     Z=Recons;
%     end
%     figure; imshow(Recons,[])
% end


% Uses median and wiener filters
% Kmedian = medfilt2(grayImage);
% figure;imshowpair(grayImage,Kmedian,'montage')
% Kwi ener = wiener2(grayImage,[5 5]);
% figure;imshowpair(grayImage,Kwiener,'montage')

Kmovemean1 = movmean(grayImage1,[5 5]);
for i = 1:1
    Kmovemean1 = movmean(Kmovemean1,[5 5]);
end
Kmovemean1 = imbinarize(Kmovemean1, 150);
figure;imshowpair(grayImage1,Kmovemean1,'montage')
title('Original and New Grayscale Image: p1.png', 'FontSize', fontSize);
Imag_F1=fft2(grayImage1); % uncentered FFT
Image_F_C1=fftshift(log(1+abs(Imag_F1))); % Centered FFT
Imag_FNew1=fft2(Kmovemean1); % uncentered FFT
Image_F_CNew1=fftshift(log(1+abs(Imag_FNew1))); % Centered FFT
figure;imshowpair(Image_F_C1,Image_F_CNew1,'montage')
title('Original and New Spectrum Image: p1.png', 'FontSize', fontSize);

Kmovemean2 = movmean(grayImage2,[5 5]);
for i = 1:1
    Kmovemean2 = movmean(Kmovemean2,[5 5]);
end
Kmovemean2 = imbinarize(Kmovemean2, 150);
figure;imshowpair(grayImage2,Kmovemean2,'montage')
title('Original and New Grayscale Image: p1\_2.png', 'FontSize', fontSize);
Imag_F2=fft2(grayImage2); % uncentered FFT
Image_F_C2=fftshift(log(1+abs(Imag_F2))); % Centered FFT
Imag_FNew2=fft2(Kmovemean2); % uncentered FFT
Image_F_CNew2=fftshift(log(1+abs(Imag_FNew2))); % Centered FFT
figure;imshowpair(Image_F_C2,Image_F_CNew2,'montage')
title('Original and New Spectrum Image: p1\_2.png', 'FontSize', fontSize);

Kmovemean3 = movmean(grayImage3,[5 5]);
for i = 1:1
    Kmovemean3 = movmean(Kmovemean3,[5 5]);
end
Kmovemean3 = imbinarize(Kmovemean3, 150);
figure;imshowpair(grayImage3,Kmovemean3,'montage')
title('Original and New Grayscale Image: p1\_3.png', 'FontSize', fontSize);
Imag_F3=fft2(grayImage3); % uncentered FFT
Image_F_C3=fftshift(log(1+abs(Imag_F3))); % Centered FFT
Imag_FNew3=fft2(Kmovemean3); % uncentered FFT
Image_F_CNew3=fftshift(log(1+abs(Imag_FNew3))); % Centered FFT
figure;imshowpair(Image_F_C3,Image_F_CNew3,'montage')
title('Original and New Spectrum Image: p1\_3.png', 'FontSize', fontSize);

Kmovemean4 = movmean(grayImage4,[5 5]);
for i = 1:2
    Kmovemean4 = movmean(Kmovemean4,[5 5]);
end
Kmovemean4 = imbinarize(Kmovemean4, 150);
figure;imshowpair(grayImage4,Kmovemean4,'montage')
title('Original and New Grayscale Image: p1\_4.png', 'FontSize', fontSize);
Imag_F4=fft2(grayImage4); % uncentered FFT
Image_F_C4=fftshift(log(1+abs(Imag_F4))); % Centered FFT
Imag_FNew4=fft2(Kmovemean4); % uncentered FFT
Image_F_CNew4=fftshift(log(1+abs(Imag_FNew4))); % Centered FFT
figure;imshowpair(Image_F_C4,Image_F_CNew4,'montage')
title('Original and New Spectrum Image: p1\_4.png', 'FontSize', fontSize);

Kmovemean5 = movmean(grayImage5,[5 5]);
for i = 1:3
    Kmovemean5 = movmean(Kmovemean5,[5 5]);
end
Kmovemean5 = imbinarize(Kmovemean5, 150);
figure;imshowpair(grayImage5,Kmovemean5,'montage')
title('Original and New Grayscale Image: p1\_5.png', 'FontSize', fontSize);
Imag_F5=fft2(grayImage5); % uncentered FFT
Image_F_C5=fftshift(log(1+abs(Imag_F5))); % Centered FFT
Imag_FNew5=fft2(Kmovemean5); % uncentered FFT
Image_F_CNew5=fftshift(log(1+abs(Imag_FNew5))); % Centered FFT
figure;imshowpair(Image_F_C5,Image_F_CNew5,'montage')
title('Original and New Spectrum Image: p1\_5.png', 'FontSize', fontSize);

Kmovemean6 = movmean(grayImage6,[5 5]);
for i = 1:3
    Kmovemean6 = movmean(Kmovemean6,[5 5]);
end
Kmovemean6 = imbinarize(Kmovemean6, 150);
figure;imshowpair(grayImage6,Kmovemean6,'montage')
title('Original and New Grayscale Image: p1\_6.png', 'FontSize', fontSize);
Imag_F6=fft2(grayImage6); % uncentered FFT
Image_F_C6=fftshift(log(1+abs(Imag_F6))); % Centered FFT
Imag_FNew6=fft2(Kmovemean6); % uncentered FFT
Image_F_CNew6=fftshift(log(1+abs(Imag_FNew6))); % Centered FFT
figure;imshowpair(Image_F_C6,Image_F_CNew6,'montage')
title('Original and New Spectrum Image: p1\_6.png', 'FontSize', fontSize);

Kmovemean7 = movmean(grayImage7,[5 5]);
for i = 1:3
    Kmovemean7 = movmean(Kmovemean7,[5 5]);
end
Kmovemean7 = imbinarize(Kmovemean7, 150);
figure;imshowpair(grayImage7,Kmovemean7,'montage')
title('Original and New Grayscale Image: p1\_7.png', 'FontSize', fontSize);
Imag_F7=fft2(grayImage7); % uncentered FFT
Image_F_C7=fftshift(log(1+abs(Imag_F7))); % Centered FFT
Imag_FNew7=fft2(Kmovemean7); % uncentered FFT
Image_F_CNew7=fftshift(log(1+abs(Imag_FNew7))); % Centered FFT
figure;imshowpair(Image_F_C7,Image_F_CNew7,'montage')
title('Original and New Spectrum Image: p1\_7.png', 'FontSize', fontSize);

Kmovemean8 = movmean(grayImage8,[5 5]);
for i = 1:3
    Kmovemean8 = movmean(Kmovemean8,[5 5]);
end
Kmovemean8 = imbinarize(Kmovemean8, 150);
figure;imshowpair(grayImage8,Kmovemean8,'montage')
title('Original and New Grayscale Image: p1\_8.png', 'FontSize', fontSize);
Imag_F8=fft2(grayImage8); % uncentered FFT
Image_F_C8=fftshift(log(1+abs(Imag_F8))); % Centered FFT
Imag_FNew8=fft2(Kmovemean8); % uncentered FFT
Image_F_CNew8=fftshift(log(1+abs(Imag_FNew8))); % Centered FFT
figure;imshowpair(Image_F_C8,Image_F_CNew8,'montage')
title('Original and New Spectrum Image: p1\_8.png', 'FontSize', fontSize);

% Recons = [];
% for g = 1 : size(Kwiener,2)
%     Recons = [Recons, movmean(Kwiener(:,g),[10,1])];
%     Z=Recons;
% end
% figure; imshow(Recons,[])
% for h=1:20
%     for g = 1 : size(Kwiener,2)
%     Recons(:,g) = movmean(Kwiener(:,g),[10,1]);
%     Z=Recons;
%     end
%     figure; imshow(Recons,[])
% end