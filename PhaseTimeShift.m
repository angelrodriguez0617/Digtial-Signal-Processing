% ECE 4750
% This code is written by Dr. Shekaramiz, UVU, ECE
% Creating functions in MATLAB and Practicing on phase and Time Shift.
clc, close all; clear
% -------------------------
% Unit Spet Function; u(t)
u = @(t)   1.0.*(t>=0)
t  =(-3:0.01: 3); figure; plot(t,u(t),'LineWidth',2); title('u(t)'); grid  
% --------------------------
% Time Shift
t  =(-8:0.01: 8); figure; plot(t,u(t-2),'LineWidth',2); title('u(t-2)'); grid;
figure; subplot(611); plot(t,u(t),'LineWidth',2); title('u(t)'); grid 
subplot(612); plot(t,u(t-2),'LineWidth',2); title('u(t-2)'); grid;
subplot(613); plot(t,u(t+2),'LineWidth',2); title('u(t+2)'); grid;
subplot(614); plot(t,u(-t),'LineWidth',2); title('u(-t)'); grid;
subplot(615); plot(t,2*u(t-2)+1,'LineWidth',2); title('2*u(t-2)+1'); grid;
subplot(616); plot(t,u(-t-2),'LineWidth',2); title('u(-t-2)'); grid;
%----------------------------
% A Pulse: u(t)-u(t-2)
p = @(t)  1.0.*((t>=0) & (t<2)); 
t  =(-10:0.01: 10); figure; plot(t,p(t),'LineWidth',2);
grid; title('u(t)-u(t-2)')
%----------------------------
f = @(t)  exp(-t).*cos(2*pi*t);
g= @(t)  f(t).*p(t); 
t  =(-10:0.01: 10); figure; plot(t,g(t),'LineWidth',2); grid; title('exp(-t)cos(2\pi t)[u(t)-u(t-2)]')
%-----------------------------
% Shifting a Function
figure; subplot(411);
t  =(-8:0.01: 8); plot(t,g(t),'LineWidth',2); title('g(t)'); grid;
subplot(412); plot(t,g(2*t+1),'LineWidth',2); title('g(t-2)'); grid; title('g(t-2)')
subplot(413); plot(t,g(2*t+1),'LineWidth',2); title('g(2t+1)'); grid; title('g(2t+1)')
subplot(414); plot(t,g(2*t+1)-3*g(-t+1),'LineWidth',2); grid; title('g(2t+1)-3g(-t+1)')