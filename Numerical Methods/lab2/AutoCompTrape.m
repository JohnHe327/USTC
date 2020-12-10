clear, clc, clf
LW = 'linewidth'; lw = 1;
format long

a = -1; b = 1;
n = 1;
h = (b-a) / n;
epsilon = 1e-15;
total_log = 30;
Tn = zeros(1, total_log);

x = linspace(a, b, n+1);
Tn(1) = h*(Func(a)/2 + sum(Func(x(2:end-1))) + Func(b)/2);
for i = 2 : total_log
    H = h * sum(Func(a+(2*(1:n)-1)*h/2));
    Tn(i) = (Tn(i-1) + H) / 2;
    h = h / 2; n = n * 2;
    if (i > 1 && abs(Tn(i) - Tn(i-1)) < 3 * epsilon)
        break
    end
end
Tn(i+1:end) = Tn(i);
2^(i-1) + 1
Tn(i)

Iter = linspace(2, total_log, total_log-1);
error_bound = abs(Tn(2:total_log) - Tn(1:total_log-1))/3;
semilogy(Iter, error_bound, 'rx', LW, lw)
xlabel('number of quadrature points n')
ylabel('error')
legend('error bound', 'location', 'ne')

function y = Func(x)
    y = sin(cos(sin(cos(x))));
end
