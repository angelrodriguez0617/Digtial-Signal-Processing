clc; clear; close all
% Example on Amplitude Modulation

t = 0: 0.001: 0.2;
f_delta = 10; x_1 = cos(2*pi*f_delta*t);
f_c = 50; x_2 = cos(2*pi*f_c*t);
X = x_1.*x_2;
plot(t,x_1,'-.','LineWidth',2); hold on; plot(t,x_2,'--','LineWidth',2); plot(t,X,'LineWidth',2); 
legend('x_1','x_2','x=x_1*x_2'); grid; title('AM Modulation'); xlabel('time (sec)')