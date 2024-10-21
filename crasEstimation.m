
function [h0, hest, err, E] = crasEstimation(Ts,A,B,C,D,F,N,K,sigma2)

sys = idpoly(A, B, C, D, F, sigma2, Ts);
h0 = impulse(sys,K);

u = idinput(N);
y = sim(sys,u,'Noise');

data = iddata(y,u,Ts);
hest = cra(data,K, 10,0);

err = h0 - hest;
E = sum(err.^2);

end
    