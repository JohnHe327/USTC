clear,clc
LW = 'LineWidth'; lw = 2;
MS = 'MarkerSize'; ms = 20;
format long

F = @(x)(sin(cos(sin(cos(x)))));
N = 30;
epsilon = 1e-15;
AbsErr = zeros(N, 1);
Integrate = zeros(N,1);
count = 0;
for n = 1 : N
    [x, w] = gauss(n);
    Integrate(n) = w*F(x);
    count = count + length(x);
    if n > 1
        AbsErr(n) = abs(Integrate(n) - Integrate(n-1));
        if AbsErr(n) < epsilon
            break
        end
    end
end
count
Integrate(n)

nvec = 1:N; % number of the quadrature points
semilogy(nvec, AbsErr, '.', MS, ms)
xlabel('number of quadrature points n')
ylabel('error')
legend('absolute Error')

% GAUSS  nodes x (Legendre points) and weights w
%        for Gauss quadrature
function [x,w] = gauss(N)
    beta = .5 ./ sqrt(1 - (2 * (1:N-1)).^(-2));
    T = diag(beta,1) + diag(beta,-1);
    [V,D] = eig(T);
    x = diag(D); [x,i] = sort(x);
    w = 2 * V(1,i).^2;
end  
