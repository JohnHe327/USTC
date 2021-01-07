clear, clc, clf
MS = 'MarkerSize'; ms = 10;
V = diag([1,2,3,4,5]);
U = orth(rand(5));
A = U*V*U';
b = rand(5,1);

lambda_n = max(eig(A));
lambda_1 = min(eig(A));
omega_b = 2 / (lambda_1+lambda_n);
delta_w = 1e-2;
epsilon = 1e-6;
for omega = delta_w:delta_w:2/lambda_n-delta_w
    M = eye(5) / omega;
    N = M - A;
    x = zeros(5,1);
    x_new = ones(5,1);
    while(max(abs(x_new - x)) > epsilon)
        x = x_new;
        x_new = M \ N * x + M \ b;
    end
    max_err = max(abs(x_new - A\b))

    if omega < omega_b
        rho_equa = 1 - omega*lambda_1;
    elseif omega > omega_b
        rho_equa = omega*lambda_n - 1;
    else
        rho_equa=(lambda_n-lambda_1)/(lambda_n+lambda_1);
    end
    rho_Gw = max(abs(eig(M\N)));
    
    plot(omega, rho_Gw, 'r.', MS, ms), hold on
    plot(omega, rho_equa, 'ko', MS, ms)
    xlabel('omega')
    ylabel('rho')
    legend('rho-Gw', 'rho-equation', 'location', 'sw')
    hold on
end
