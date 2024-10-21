Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;

SigmaValues = [0.1 0.5 1 5 10 100];

SigmaValues = 0:0.2:20;

cra_size = 50;
N = 10000;

errValues = zeros(length(SigmaValues),1);

ploth = 0;


for i = 1:length(SigmaValues)
    sys = idpoly(A, B, C, D, F, SigmaValues(i), Ts);
    h0 = impulse(sys,cra_size);

    u = idinput(N);
    y = sim(sys,u, 'Noise');
    
    data = iddata(y,u,Ts);
    hest = cra(data,cra_size,0);
    
    err = mean(abs(h0 - hest));
    errValues(i) = err;
    
    if ploth
        figure();
        plot(h0); hold on
        plot(hest);
        legend('Original Impulse Response','Estimated Input Response');
    end 
end

figure();
plot(SigmaValues, errValues);