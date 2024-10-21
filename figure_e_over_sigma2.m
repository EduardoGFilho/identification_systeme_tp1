Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;
K = 50;
N = 1000;

Sig2Values = 0:0.1:10;

EVec = zeros(length(Sig2Values),1);

for i = 1:length(Sig2Values)
    [h0, hest, err, E] = crasEstimation(Ts,A,B,C,D,F,N,K,Sig2Values(i));
    EVec(i) = E;
end

figure();
plot(Sig2Values,EVec,'r-');
grid();
legend('Error Energy');
xlabel('Noise Variance')
set(gcf, 'PaperSize',[10 10]);
print(gcf,'figure_E_over_Sigma2.pdf', '-dpdf','-bestfit');