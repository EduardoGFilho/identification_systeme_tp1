Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;
N = 100;
K = 50;
sigma2 = 0;
orders = [2 2 1];

[h0, hest, err, E, data, sysArx] = arxEstimation(Ts,A,B,C,D,F,N,K,sigma2,orders);

np = nyquistplot(sysArx);
showConfidence(np,2);
saveas(gcf,'figure_arx_221_nyquist_uncertainty.pdf')
    
