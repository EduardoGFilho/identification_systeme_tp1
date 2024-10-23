Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;
N = 1000;
K = 50;
sigma2 = 0;

[h0, hest, err, E] = crasEstimation(Ts,A,B,C,D,F,N,K,sigma2);

figure();
%subplot(2,1,1);
plot(h0, 'r-'); hold on;
plot(hest, 'b-');
grid();
legend('Original Impulse Response', 'Estimated Impulse Response (CRA)');
%subplot(2,1,2);
%plot(err, 'r-'); hold on;
%grid();
%legend('Error Signal');

set(gcf, 'PaperSize',[15 15]);
print(gcf,'h0_and_hest.pdf', '-dpdf','-bestfit');
save('hest_error.mat');

