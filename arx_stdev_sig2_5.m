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

[A,B,C,D,F,dA,dB,dC,dD,dF] = polydata(sysArx);
save('arx_stdev_sig2_0.mat');
    
