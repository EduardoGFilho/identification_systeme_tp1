
x = linspace(-5,5,100);
gauss01 = gaussdist(x,0,0.1);
gauss05 = gaussdist(x,0,0.5);
gauss1 = gaussdist(x,0,1);
gauss5 = gaussdist(x,0,5);

figure();
plot(x, gauss01, "b-"); hold on;
plot(x, gauss05, "k-");
plot(x, gauss1, "g-");
plot(x, gauss5, "y-");

hold on;
grid();
ylabel("PDF")
xlabel("x");
legend('\sigma^2 = 0.1', '\sigma^2 = 0.5','\sigma^2 = 1','\sigma^2 = 5');
set(gcf, 'PaperSize',[15 15]);
print(gcf,'figure_guassians.pdf', '-dpdf','-bestfit');

