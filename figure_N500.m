Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;
N = 500;
K = 50;
sigma2 = 0;

[h0, hest, err, E] = crasEstimation(Ts,A,B,C,D,F,N,K,sigma2);

figure();
plot(h0, 'r-'); hold on;
plot(hest, 'b-');
grid();
legend('Original Impulse Response', 'Estimated Impulse Response (CRA)');
saveas(gcf,'figure_N=500.pdf')