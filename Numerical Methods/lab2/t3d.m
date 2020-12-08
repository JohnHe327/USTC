clear, clc, clf
LW = 'linewidth'; lw = 2;
f = @(x)(x.^2.*exp(-5.*x)./2);
%H = 10.^-(1:0.1:3);
H=0.1;
err = zeros(length(H), 1);

for i = 1:length(H)
    h = H(i);
    xn = (0:h:2)';
    exact = f(xn);

    x = xn(1);
    yn = zeros(length(xn), 1);
    k1 = x * exp(-5 * x) - 5 * yn(1);
    k2 = (x+h/2) * exp(-5 * (x+h/2)) - 5*(yn(1)+h/2*k1);
    k3 = (x+h) * exp(-5*(x+h)) - 5*(yn(1)-h*k1+2*h*k2);
    yn(2) = yn(1) + h/6*(k1+4*k2+k3);

    for k = 3:length(yn)
        yn(k) = ( yn(k-2) + ...
        h/3*(xn(k)*exp(-5*xn(k))) + ...
        4*h/3*(xn(k-1)*exp(-5*xn(k-1))-5*yn(k-1)) + ...
        h/3*(xn(k-2)*exp(-5*xn(k-2))-5*yn(k-2)) ) / ...
        (1+5*h/3);
    end

    err(i) = abs(yn(end) - f(xn(end)));
end

loglog(H, err, '.', LW, lw)
xlabel('h')
ylabel('error')
legend('error', 'location', 'se')
