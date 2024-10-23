Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;
N = 1000;
K = 50;
sigma2 = 0.1;

[h0, hest01, err01, E01] = crasEstimation(Ts,A,B,C,D,F,N,K,0.1);
[h0, hest05, err05, E05] = crasEstimation(Ts,A,B,C,D,F,N,K,0.5);
[h0, hest1, err1, E1] = crasEstimation(Ts,A,B,C,D,F,N,K,1);
[h0, hest5, err5, E5] = crasEstimation(Ts,A,B,C,D,F,N,K,5);

figure();
plot(h0, 'r-'); hold on;
plot(hest01, 'b-'); hold on;
plot(hest05, 'k-'); hold on;
plot(hest1, 'g-'); hold on;
plot(hest5, 'y-'); hold on;
grid();
legend('Original Impulse Response', 'Estimated Impulse Response (CRA, \sigma^2 = 0.1)' ...
    , 'Estimated Impulse Response (CRA, \sigma^2 = 0.5)' ...
    , 'Estimated Impulse Response (CRA, \sigma^2 = 1)' ...
    , 'Estimated Impulse Response (CRA, \sigma^2 = 5)' );
set(gcf, 'PaperSize',[15 15]);
print(gcf,'figure_various_sigma2.pdf', '-dpdf','-bestfit');