Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;
K = 50;
sigma2 = 0;

NValues = 100:100:10000;

EVec = zeros(length(NValues),1);

for i = 1:length(NValues)
    [h0, hest, err, E] = crasEstimation(Ts,A,B,C,D,F,NValues(i),K,sigma2);
    EVec(i) = E;
end

figure();
plot(NValues,EVec,'r-');
grid();
legend('Error Energy');
xlabel('Duration of Input')
saveas(gcf,'figure_E_over_N.pdf')