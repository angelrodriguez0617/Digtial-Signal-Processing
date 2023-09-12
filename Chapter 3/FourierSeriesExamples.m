clc,clear, close all;
% ECE 4750
% Fourier Series Analysis and synthesis
% -------------------------------------------------------------------------
Case = 0;
if Case
    n = 1 : 100; % Play with the number of desired harmonics
    t = -6 : 0.01 : 6;
    a_0 = 1/2;
    a_n = 2./(n*pi).*sin(n.*pi/2);
    b_n = 0;
    F = a_0;
    for K = 1 : length(n)
        F = F + a_n(K) .* cos(n(K).*t);
        % figure(K); plot(t, F); grid
    end
    
    figure(1); plot(t, F); grid;
    title(['Approximating a periodic pulse signal with n=',num2str(n(end))]);
else
    n = 1 : 7; % Play with the number of desired harmonics
    t = -3 : 0.01 : 3;
    a_0 = 0;
    b_n = 8/(pi^2)*(1./n.^2).*sin(n.*pi/2);
    a_n = 0;
    F = a_0;
    for K = 1 : length(n)
        F = F + b_n(K) .* sin(2*n(K).*t);
        % figure(K); plot(t, F); grid
    end
    figure(2); plot(t, F); grid;
    title(['Approximating a periodic triangular pulse signal with n=',num2str(n(end))]);

end

    
    