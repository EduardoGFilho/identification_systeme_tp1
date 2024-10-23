Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = [1 -1.3 .9];
D = 1;
F = 1;

cra_size = 50;
N = 1000;

sys = idpoly(A, B, C, D, F, 5, Ts);
h0 = impulse(sys,cra_size);

u = idinput(N);
y = sim(sys,u,'Noise');

data = iddata(y,u,Ts);
sysArx = arx(data,[2 2 1]);
sysArmax = armax(data, [2 2 2 1]);
hest = impulse(sysArx,cra_size);

figure();
np = nyquistplot(sysArx);
showConfidence(np,2);
set(gcf, 'PaperSize',[15 15]);
print(gcf,'figure_arx_221_nyquist_filtered_noise.pdf', '-dpdf','-bestfit');

figure();
np = nyquistplot(sysArmax);
showConfidence(np,2);
set(gcf, 'PaperSize',[15 15]);
print(gcf,'figure_armax_2221_nyquist_filtered_noise.pdf', '-dpdf','-bestfit');
    
