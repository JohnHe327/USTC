clear, clc
A = [4, -2, 4, 2;
    -2, 10, -2, -7;
    4, -2, 8, 4;
    2, -7, 4, 7];
b = [8;2;16;6];
n=length(b);
L = zeros(n,n);

for j = 1:n
    for k = 1:j-1
        L(j,j) = L(j,j) + L(j,k)^2;
    end
    L(j,j) = sqrt(A(j,j) - L(j,j));
    for i = j+1:n
        for k = 1:j-1
            L(i,j) = L(i,j) + L(i,k)*L(j,k);
        end
        L(i,j)=(A(i,j)-L(i,j))/L(j,j);
    end
end

y=zeros(n,1);
y(1) = b(1) / L(1,1);
for i = 2:n
    for k = 1:i-1
        y(i) = y(i) + L(i,k)*y(k);
    end
    y(i) = (b(i)-y(i)) / L(i,i);
end

x=zeros(n,1);
x(n) = y(n) / L(n,n);
for i = n-1:-1:1
    for k = i+1:n
        x(i) = x(i) + L(k,i)*x(k);
    end
    x(i) = (y(i)-x(i)) / L(i,i);
end

x