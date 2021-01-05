clear, clc,clf
MS = 'MarkerSize'; ms = 10;
F = @(x) x.^2.*cos(x);
% gauss.m
[x, w] = gauss(20);
I = w * F(x);

% cheb
epsilon = 1e-6;
for n = 1:20
    tmp = ceil(n/2);
    x = cos(linspace(pi,0,n))';
    c = ones(1,n);
    w = [x(1:tmp); c(1:tmp)'];
    
    deltaw = ones(2*tmp,1);
    while(max(abs(deltaw)) > epsilon)
        deltaw = jacob(n,w(1:tmp),w(tmp+1:end)') \...
                    f(n,w(1:tmp),w(tmp+1:end)');
        w = w + deltaw;
    end
    
    for i = 1:tmp
        x(i) = w(i);
        x(end-i+1) = -w(i);
        c(i) = w(tmp+i);
        c(end-i+1) = w(tmp+i);
    end
    semilogy(n, abs(c*F(x)-I), 'r.', MS, ms)
    xlabel('sampling point n')
    ylabel('Abs err')
    hold on
end

function y = f(n, x, c)
    y = zeros(n,1);
    for i = 1:n
        y(i) = c * (x.^(2*(i-1))) - 1/(2*i-1);
        if i == 1 && mod(n,2)
            y(i) = y(i) - c(end)/2;
        end
    end
    y = -y;
end

function y = jacob(n, x, c)
    tmp = ceil(n/2);
    y = zeros(n, 2*tmp);
    for i = 1:n
        for j = 1:tmp
            y(i,j) = 2*(i-1)*c(j)*x(j)^(2*(i-1)-1);
            y(i,j+tmp) = x(j)^(2*(i-1));
        end
    end
    if mod(n,2)
        y(:,end) = y(:,end)/2;
    end
end

function [x,w] = gauss(N)
    beta = .5./sqrt(1-(2*(1:N-1)).^(-2));
    T = diag(beta,1) + diag(beta,-1);
    [V,D] = eig(T);
    x = diag(D); [x,i] = sort(x);
    w = 2*V(1,i).^2;
end
