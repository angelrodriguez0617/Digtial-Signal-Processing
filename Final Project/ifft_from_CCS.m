clc, clear; close all;

fid=fopen('audio_output_ifft.txt');
% Read the whole lines of your files in a cell array
A=textscan(fid,'%s','Delimiter','\n');
% Close file
fclose(fid);

fid2=fopen('impulse_output_ifft.txt');
% Read the whole lines of your files in a cell array
A2=textscan(fid2,'%s','Delimiter','\n');
% Close file
fclose(fid2);

% Extract the even lines
Tmp=A{1,1};
real=Tmp(3:2:end);
imaginary=Tmp(4:2:end);

% Extract the even lines
Tmp2=A2{1,1};
real2=Tmp2(3:2:end);
imaginary2=Tmp2(4:2:end);

% Use cellfun to apply str2num to every cell in out1
% Real part of .txt file
out_real=cellfun(@str2num,real,'UniformOutput',false);
out_real = cell2mat(out_real);
% Imaginary part of .txt file
out_imaginary=cellfun(@str2num,imaginary,'UniformOutput',false);
out_imaginary = cell2mat(out_imaginary);
output = out_real + j.*(out_imaginary);

% Use cellfun to apply str2num to every cell in out1
% Real part of .txt file
out_real2=cellfun(@str2num,real2,'UniformOutput',false);
out_real2 = cell2mat(out_real2);
% Imaginary part of .txt file
out_imaginary2=cellfun(@str2num,imaginary2,'UniformOutput',false);
out_imaginary2 = cell2mat(out_imaginary2);
output2 = out_real2 + j.*(out_imaginary2)

output = abs(output);
output = [output(end:-1:1); output];
N = length(output)

output2 = abs(output2);
output2 = [output2(end:-1:1); output2];
N2 = length(output2)

impulseID = fopen('impulse.bin', 'r', 'native');
impulse = fread(impulseID, Inf, 'int16');
fclose(impulseID);

figure;
subplot(2, 1, 1);
plot((-N/2:N/2-1), output);   
title("IFFT from CCS - audio\_output.txt");
subplot(2, 1, 2);
plot((-N2/2:N2/2-1), output2);   
title("IFFT from CCS - impulse\_output.txt");
