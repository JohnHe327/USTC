clear, clc, clf
LW = 'linewidth'; lw = 1;

n = 15;
x = linspace(-1, 1, n + 1)';
m = 1000;
xx = linspace(-1, 1, m + 1)';
F = @(x)(sin(x));
dF = @(x)(cos(x));
exact = dF(xx);

pi_j = ones(n + 1, 1);
for j = 1 : n + 1
    for k = 1 : n + 1
        if k ~= j
            pi_j(j) = pi_j(j) * (x(j) - x(k));
        end
    end
end

f_j = F(x);

l_j = ones(m + 1, n + 1);
for i = 1 : m + 1
    for j = 1 : n + 1
        loc_sum = 0;
        for k = 1 : n + 1
            if k ~= j
                l_j(i, j) = l_j(i, j) * (xx(i) - x(k));
                loc_sum = loc_sum + 1/(xx(i)-x(k));
            end
        end
        l_j(i, j) = l_j(i, j) * loc_sum / pi_j(j);
    end
end

dp = l_j * f_j;

figure(1)
plot(xx, exact, 'k', LW, lw), hold on
plot(xx, dp, 'r:', LW, lw)
xlabel('x')
ylabel('y')
legend('exact', 'interpolant', 'location', 'se')

figure(2)
plot(2)
semilogy(xx, abs(exact - dp), 'k', LW, lw)
xlabel('x')
ylabel('error')
legend('error', 'location', 'ne')
