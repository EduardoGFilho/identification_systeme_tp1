load('hest_error.mat');
figure();
plot(err, 'r-'); hold on;
grid();
legend('Error Signal');

set(gcf, 'PaperSize',[15 15]);
print(gcf,'figure_hest_error.pdf', '-dpdf','-bestfit');

