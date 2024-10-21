Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;
N = 1000;
K = 50;
sigma2 = 0;

[h0, hest100, err100, E100] = crasEstimation(Ts,A,B,C,D,F,100,K,sigma2);
[h0, hest500, err500, E500] = crasEstimation(Ts,A,B,C,D,F,500,K,sigma2);
[h0, hest1000, err1000, E1000] = crasEstimation(Ts,A,B,C,D,F,1000,K,sigma2);

figure();
plot(h0, 'r-'); hold on;
plot(hest100, 'b-'); hold on;
plot(hest500, 'k-'); hold on;
plot(hest1000, 'g-'); hold on;
grid();
legend('Original Impulse Response', 'Estimated Impulse Response (CRA, N = 100)' ...
    , 'Estimated Impulse Response (CRA, N = 500)' ...
    , 'Estimated Impulse Response (CRA, N = 1000)');
saveas(gcf,'figure_various_N.pdf')

% To consult error values and such
save("figure_various_N.mat")