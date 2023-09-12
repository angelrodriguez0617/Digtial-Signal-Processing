% ECE 4750 (DSP)
% Plotting the multplication of sinusoids using dot product.

clc, close all; clear;
Ex = 1;
if Ex==1
    % Ex. 1
    % x1(t) = cos(2*pi*20*t)
    % x2(t) = cos(2*pi*10*t)
    % x(t) = x1(t)*x2(t)
    t = 0:0.0001:0.1;
    % f = [10; 20]; % make sure t and f have the same vector sizes (either column or row vactors).
    xa = 2*cos(2*pi*20*t);
    xb = cos(2*pi*200*t);
    figure; plot(t,xa,'LineWidth',1);
    hold on
    plot(t,xb,'LineWidth',1);
    hold off
    grid; legend('2cos(2π(20)t)','cos(2π(200)t)'); title(' Multiplicative Components'); xlabel('t (sec)');      
    % Plotitng the multiplied signals.
    t = 0:0.00001:0.1;
    x1 = 2*cos(2*pi*20*t);
    x2 = cos(2*pi*200*t);
    x = x1.*x2;
    figure; plot(t,x,'LineWidth',2);
    hold on 
    plot(t,x1,'LineWidth',2);
    plot(t,-x1,'LineWidth',2);
    grid; legend('2cos(2π(20)t)cos(2π(200)t)','2cos(2π(20)t)', '-2cos(2π(20)t)'); title('Multiplied signals'); xlabel('t (sec)');
    hold off
end


