clear, clc, clf
LW = 'linewidth'; lw = 1;
format long

MAX_ITER = 30;
a = -1; b = 1;
epsilon = 1e-15;
R_kj = zeros(MAX_ITER, MAX_ITER);
error_bound = zeros(MAX_ITER);

h = b - a;
k = (1 : MAX_ITER);
h_k = h ./ (2 .^ (k - 1));


R_kj(1,1) = (Func(a) + Func(b)) * h / 2;
count = 2;
for k = 2 : MAX_ITER
    for i = 1 : 2^(k-2)
        R_kj(k,1) = R_kj(k,1) + Func(a + (2*i-1)*h_k(k));
        count = count + 1;
    end
    R_kj(k,1) = (R_kj(k-1,1) + h_k(k-1) * R_kj(k,1)) / 2;
    
    for j = 2:k
        R_kj(k,j) = R_kj(k,j-1) + (R_kj(k,j-1) - R_kj(k-1,j-1)) / (4^(j-1)-1);
    end

    error_bound(k) = abs(R_kj(k,k) - R_kj(k-1,k-1));
    if error_bound(k) < epsilon
        break
    end
end
count
R_kj(k,k)

iter = 1 : MAX_ITER;
semilogy(iter, error_bound, 'rx', LW, lw)
xlabel('number of quadrature points n')
ylabel('error')
legend('error', 'location', 'ne')

function y = Func(x)
    y = sin(cos(sin(cos(x))));
end
