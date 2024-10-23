Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;

cra_size = 50;
N = 1000;

sys = idpoly(A, B, C, D, F, 0, Ts);
h0 = impulse(sys,cra_size);

u = idinput(N);
y = sim(sys,u);

data = iddata(y,u,Ts);
sysArx = arx(data,[2 2 2]);
hest = impulse(sysArx,cra_size);

figure();
np = nyquistplot(sysArx);
showConfidence(np,2);
set(gcf, 'PaperSize',[15 15]);
print(gcf,'figure_arx_222_nyquist_sig0.pdf', '-dpdf','-bestfit');
    
