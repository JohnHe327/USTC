clear, clc, clf
LW = 'linewidth'; lw = 1;

F = @(x)(sin(3 .* x .^ 2));
dF = @(x)(6 .* x .* cos(3 .* x .^ 2));

MAX_ITER = 30;
iter_n = (1:MAX_ITER)';
max_error1 = zeros(MAX_ITER, 1);
max_error2 = zeros(MAX_ITER, 1); % Chebyshev error

for iter = 1:MAX_ITER
    n = 2 * iter - 1;
    x1 = linspace(-1, 1, n + 1)';
    % Chebyshev
    x2 = (0:n)';
    x2 = cos(x2 .* pi ./ n);
    
    pi1_j = ones(n + 1, 1);
    pi2_j = ones(n + 1, 1);
    for j = 1 : n + 1
        for k = 1 : n + 1
            if k ~= j
                pi1_j(j) = pi1_j(j) * (x1(j) - x1(k));
                pi2_j(j) = pi2_j(j) * (x2(j) - x2(k));
            end
        end
    end

    D1_ij = zeros(n+1, n+1);
    D2_ij = zeros(n+1, n+1);
    for i = 1:n+1
        for j = 1:n+1
            if i == j
                for k = 1:n+1
                    if k ~= j
                        D1_ij(i,j) = D1_ij(i,j) + 1/(x1(j)-x1(k));
                        D2_ij(i,j) = D2_ij(i,j) + 1/(x2(j)-x2(k));
                    end
                end
            else
                D1_ij(i,j) = pi1_j(i)/(pi1_j(j) * (x1(i)-x1(j)));
                D2_ij(i,j) = pi2_j(i)/(pi2_j(j) * (x2(i)-x2(j)));
            end
        end
    end

    f1_j = F(x1);
    f2_j = F(x2);

    dp1 = D1_ij * f1_j;
    dp2 = D2_ij * f2_j;

    exact1 = dF(x1);
    exact2 = dF(x2);

    max_error1(iter) = max(abs(dp1 - exact1));
    max_error2(iter) = max(abs(dp2 - exact2));
end

figure(1)
semilogy(iter_n, max_error1, 'k', LW, lw), hold on
semilogy(iter_n, max_error2, 'r:', LW, lw)
xlabel('x')
ylabel('error')
legend('error1', 'error2(cheby)', 'location', 'sw')
