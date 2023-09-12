% ECE 4750
% Practice on FIR Filters
% Moving Average Filter
% Application: Noise Reduction
clc, clear, close all;
% Creating a noisy signal: x1
t = 0:0.001:30;
z= 0.5*randn(1,length(t));
x = sin(t)+z;
L_X = length(x);

% Creating a moving average filter with lenght of L.
L = 500; %50; %500;
x1 = [x,x(end)*ones(1,L)];
tic
for k= 1:L_X
    y(k)=1/L*sum(x1(k:k+L));
end
toc
figure; subplot(211); plot(t,x); grid; title('Noisy Signal'); xlabel('t'); ylabel('x'); 
subplot(212); plot(t,y); grid; title('Filtered Signal'); xlabel('t'); ylabel('y');
