 %prblem 7, HW 5

function DeltaCombined(a,k0,k1)
close all
K = k0+k1;
n = 0 : 2*K;

y = zeros(2*K+1,1);
y(k0+1:k1) = a;


stem(n,y,'LineWidth',2); grid