Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = [1 -1.3 .9];
D = 1;
F = 1;

cra_size = 50;
N = 1000;
variance = 2;

sys = idpoly(A, B, C, D, F, variance, Ts);
h0 = impulse(sys,cra_size);

u = idinput(N);
y = sim(sys,u);

data = iddata(y,u,Ts);
sysArx = arx(data,[3 3 1]);
sysAmax = armax(data, [1 1 1 1]);

hest = impulse(sysAmax,cra_size);
err = mean(abs(h0 - hest));

[A1,B1,C1,D1,F1,dA,dB,dC,dD,dF] = polydata(sysArx);

bp = bodeplot(sysArx);
bpar = bodeplot(sysAmax);

%showConfidence(bp,2);
showConfidence(bpar,2);


    
