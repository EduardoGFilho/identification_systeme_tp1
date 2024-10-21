
function [h0, hest, err, E, data, sysArx] = arxEstimation(Ts,A,B,C,D,F,N,K,sigma2,orders)

sys = idpoly(A, B, C, D, F, sigma2, Ts);
h0 = impulse(sys,K);

u = idinput(N);
y = sim(sys,u,'Noise');

data = iddata(y,u,Ts);

sysArx = arx(data,orders);
hest = impulse(sysArx,K);

err = h0 - hest;
E = sum(err.^2);

end
    