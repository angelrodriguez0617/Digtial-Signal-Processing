% ECE 4750 (DSP)
% Plotting the multplication of sinusoids using dot product.

clc, close all; clear;
Ex = 1;
if Ex==1
    % Ex. 1
    % x1(t) = cos(2*pi*20*t)
    % x2(t) = cos(2*pi*10*t)
    % x(t) = x1(t)*x2(t)
    t = 0:0.001:0.2;
    f = [10; 20]; % make sure t and f have the same vector sizes (either column or row vactors).
    x = cos(2*pi*f.*t);
    figure; plot(t,x,'LineWidth',1); grid; legend('f=10 (Hz)','f=20 (Hz)')      
    % Plotitng the multiplied signals.
    t = 0:0.001:0.5;
    x1 = cos(2*pi*10*t);
    x2 = cos(2*pi*20*t);
    x = x1.*x2;
    figure; plot(t,x,'LineWidth',2); grid; title('Multiplied signals'); xlabel('t (sec)');
end

if Ex==2
    % Ex. 2
    % x1(t) = 20*cos(2*pi*40*t-0.4*pi)
    % x2(t) = 20*cos(2*pi*20*t)
    % x(t) = x1(t)*x2(t)
    t = 0:0.001:0.2;
    f = [10; 40]; % make sure t and f have the same vector sizes (either column or row vactors).
    x = 20*cos(2*pi*f.*t-0.4*pi);
    figure; plot(t,x,'LineWidth',1); grid;  legend('x_1(t)','x_2(t)')
    
    t = 0:0.001:0.1;
    x1 = 20*cos(2*pi*40*t-0.4*pi);
    x2 = 20*cos(2*pi*20*t);
    x = x1.*x2;
    figure; plot(t,x,'LineWidth',2); grid; title('Multiplied signals'); xlabel('t (sec)');
end
