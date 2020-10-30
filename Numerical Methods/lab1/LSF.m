x = [-0.7, -0.5, 0.25, 0.75];
y = [0.99, 1.21, 2.57, 4.23];
% y=a*exp(bx)
% lny=bx+lna
lny = log(y);
R = [x' ones(4, 1)];
% solve A
A = R \ lny';

a = exp(A(2));
b = A(1);
F = @(x)a*exp(b*x);
f = F(x);
% error
M2 = sqrt((y - f) * (y - f)')

xx = linspace(-1, 1, 1000);
plot(xx, F(xx), 'k', x, y, 'x')