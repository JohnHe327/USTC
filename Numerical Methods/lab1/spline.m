clear, clc, clf
LW = 'linewidth'; lw = 2;
MaxError1 = zeros(7, 1);
MaxError2 = zeros(7, 1);
MaxError3 = zeros(7, 1);
for k = 6:12
    %%
    n = 2 ^ k;
    x = linspace(-n, n, n+1)' ./ n;
    F = @(x)exp(3*cos(pi*x));
    DF = @(x)-3*pi*exp(3*cos(pi*x)).*sin(pi*x);
    D2F = @(x)9*pi^2*exp(3*cos(pi*x)).*sin(pi*x).^2 - ...
        3*pi^2*exp(3*cos(pi*x)).*cos(pi*x);
    f = F(x);
    Df = DF(x);
    D2f = D2F(x);
    %%
    h = diff(x);
    df = diff(f);
    d1 = df ./ h;
    lambda = h(2:n) ./ (h(2:n) + h(1:n-1));
    d = 6 * (df(2:n)./h(2:n) - df(1:n-1)./h(1:n-1)) ./ ...
        (h(2:n) + h(1:n-1));
    mu = 1-lambda;
    %%
    % 第一类边界条件
    M0 = D2f(1);
    Mn = D2f(n + 1);
    A1 = diag(2*ones(n-1,1)) + diag(lambda(1:n-2), 1) +...
        diag(mu(2:n-1), -1);
    D1 = [d(1)-mu(1)*M0; d(2:n-2); d(n-1)-lambda(n-1)*Mn];
    M1 = A1 \ D1;
    M1 = [M0; M1; Mn];
    %%
    % 第二类边界条件
    m0 = Df(1);
    mn = Df(n + 1);
    lambda2 = [1; lambda];
    mu2 = [mu; 1];
    d0 = 6 * ( df(1) / h(1) - m0 ) / h(1);
    dn = 6 * ( mn - df(n) / h(n) ) / h(n);
    D2 = [d0; d; dn];
    A2 = diag(2*ones(n+1,1))+diag(lambda2,1)+diag(mu2,-1);
    M2 = A2 \ D2;
    %%
    % 第三类边界条件
    lambda0 = h(1) / (h(1) + h(n));
    lambda3 = [lambda0; lambda(1:n-2)];
    mu0 = 1 - lambda0;
    d0 = 6*(df(1)./h(1) - df(n)./h(n)) / (h(1)+h(n));
    D3 = [d0; d];
    A3 = diag(2*ones(n,1)) + diag(lambda3,1) +diag(mu,-1);
    A3(1, n) = mu0;
    A3(n, 1) = lambda(n-1);
    M3 = A3 \ D3;
    M3 = [M3; M3(1)];
    %%
    MaxError1(k - 5) = CubicSpline(x, F, h, M1);
    MaxError2(k - 5) = CubicSpline(x, F, h, M2);
    MaxError3(k - 5) = CubicSpline(x, F, h, M3);
end
%%
xx = linspace(6, 12, 7);
semilogy(xx, MaxError1, 'r:', LW, lw), hold on
semilogy(xx, MaxError2, 'gx', LW, lw), hold on
semilogy(xx, MaxError3, 'b')
legend('第一类', '第二类', '第三类')
%%
function MaxError = CubicSpline(x, F, h, M)
n = size(x) - 1;
f = F(x);
MaxError = 0;
for k = 1:n
    m = 6;
    xx = linspace(x(k), x(k+1), m)';
    S = ((x(k+1)-xx).^3*M(k) + (xx-x(k)).^3*M(k+1)) / ...
        (6*h(k)) + ...
        ((x(k+1)-xx)*f(k) + (xx-x(k))*f(k+1)) / h(k) - ...
        h(k) * ((x(k+1)-xx)*M(k) + (xx-x(k))*M(k+1)) / 6;
    MaxError = max([MaxError, abs(F(xx) - S)']);
end
end
