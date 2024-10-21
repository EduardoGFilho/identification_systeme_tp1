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

I = 10;

errValues = zeros(3,I);

% Iterate over numerator order
for i = 1:I

    data = iddata(y,u,Ts);
    sysArx = arx(data,[i 10 1]);
    
    [A1,B1,C1,D1,F1,dA,dB,dC,dD,dF] = polydata(sysArx);

    rhoA = dA./A1;

    errValues(i) = rhoA;
end

figure();
plot(errValues');

bp = bodeplot(sysArx);
figure();
showConfidence(bp,2);

    
