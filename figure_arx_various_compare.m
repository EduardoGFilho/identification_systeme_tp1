   
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
sysArx111 = arx(data,[1 1 1]);
sysArx221 = arx(data,[2 2 1]);
sysArx222 = arx(data,[2 2 2]);
%hest = impulse(sysArx,cra_size);

[ymod111,fit111,ic111] = compare(data,sysArx111);
[ymod221,fit221,ic221] = compare(data,sysArx221);
[ymod222,fit222,ic222] = compare(data,sysArx222);


figure();
%compare(data,sysArx);
plot(y, 'Color', [0.5 0.5 0.5]); hold on;
plot(ymod111.OutputData,'Color', [0    0.4470    0.7410]);
plot(ymod221.OutputData,'Color', [0.8500    0.3250    0.0980]);
plot(ymod222.OutputData,'Color', [0.9290    0.6940    0.1250]);
legend111 = sprintf('%s {%.2f} %s', 'ARX model [1 1 1]:', fit111, '%');
legend221 = sprintf('%s {%.2f} %s', 'ARX model [2 2 1]:', fit221, '%');
legend222 = sprintf('%s {%.2f} %s', 'ARX model [2 2 2]:', fit222, '%');
grid();
title('Simulated Response Comparison');
ylabel('Amplitude');
xlabel('Time (seconds)');


legend('Validation data',legend111, legend221, legend222);


set(gcf, 'PaperSize',[10 10]);
print(gcf,'figure_arx_various_compare.pdf', '-dpdf','-bestfit');
    
