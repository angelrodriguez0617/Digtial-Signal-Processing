function [b,a] = ap_chb1(N, Rp, Omegac)
% Chebyshev-1 Analog Lowpass Filter Prototype
%
% [b,a] = ap_chb1(N, Rp, Omegac);
% b = nemerator polynomial coefficients
% a = denominator polynomial coefficients
% N = Order of the elliptical filter
% Rp = Passband Ripple in dB
% Omegac = cutoff frequency in rad/sec
%
[z,p,k] = cheb1ap(N,Rp);
a = real(poly(p));
aNn = a(N+1);
p = p*Omegac;
a = real(poly(p));
aNu = a(N+1);
k = k*aNu/aNn;
b0 = k;
B = real(poly(z));
b = k*B;