
% Prblem 6, HW 5
function Delta(K)
close all
n = 0 : 2*K;

y = zeros(2*K+1,1);
y(K+1) = 1;

stem(n,y,'LineWidth',2); grid