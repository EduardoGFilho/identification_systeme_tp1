Ts = 1;
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = 1;
D = 1;
F = 1;

NValues = [100,500,1000];

NValues = 100:100:10000;

taille = 50;
sys = idpoly(A, B, C, D, F, 0, Ts);
h0 = impulse(sys,taille);

errValues = zeros(length(NValues),1);

ploth = 0;


for i = 1:length(NValues)

    N = NValues(i);
    u = idinput(N);
    y = sim(sys,u);
    
    data = iddata(y,u,Ts);
    hest = cra(data,taille,0);
    
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
plot(NValues,errValues);