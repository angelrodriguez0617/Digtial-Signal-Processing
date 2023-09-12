clc, close all; clear
p = @(t)  1.0.*((t>=0) & (t<2)); 
t  =(-10:0.01: 10); figure; plot(t,p(t),'LineWidth',2);
grid; title('u(t)-u(t-2)')
%----------------------------
% Combining Functions
f = @(t) exp(-t).*p(t).*cos(2*pi*t);
n_y_begin = 2*t(1);
n_y_end = length(f(t))+length(p(t))+n_y_begin-2*0.01;
n_y = n_y_begin : 0.01 : n_y_end; 
t  =(-10:0.01: 10); plot(t,f(t),'LineWidth',2); grid; title('exp(-t)cos(2*pi*t)p(t)')
y= @(t) conv(f(t),p(t))
figure; plot(2*t(1):0.01:20,y(t)); grid; ylabel('y(t)'); xlabel('t');

