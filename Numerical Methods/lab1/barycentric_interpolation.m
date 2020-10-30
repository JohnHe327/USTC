clear, clc, clf
LW = 'linewidth'; lw = 1;

n = 5000;
x = linspace(0, n, n + 1)';
x = cos(x .* pi ./ n);
m = 100000;
xx = linspace(-1, 1, m + 1)';
F = @(x)(tanh(20 * sin(12 * x)) + ...
    0.02 * exp(3 * x) .* sin(300 * x));
f = F(x);

numerator = zeros(m + 1, 1);
denominator = zeros(m + 1, 1);
for j = 1 : n + 1
    l = (-1)^(j-1) ./ (xx - x(j));
    if j == 1 || j == n + 1
        l = l ./ 2;
    end
    numerator = numerator + l .* f(j);
    denominator = denominator + l;
end
p = numerator ./ denominator;

figure(1)
plot(xx, F(xx), 'k', LW, lw), hold on
plot(xx, p, 'r:', LW, lw)
legend('exact', 'interpolant', 'location', 'sw')
axis([-1, 1, -1.5, 1.3])

figure(2)
plot(2)
semilogy(xx, abs(F(xx) - p), 'k', LW, lw)
legend('error', 'location', 'ne')
axis([-1, 1, 10^(-17), 10^(-13)])