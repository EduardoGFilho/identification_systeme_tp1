function gdst = gaussdist(x,mu, sigma2)
    gdst = (1/(sqrt(sigma2*2*pi)))*exp(-.5*(x-mu).^2/(sigma2));
end

