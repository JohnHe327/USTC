clear, clc
x = linspace(-1,1,6)';
c = ones(6,1);
w = [x(1:3); c(1:3)];

epsilon = 1e-6;
deltaw = ones(6,1);
while(max(abs(deltaw)) > epsilon)
    deltaw = jacob(w(1),w(2),w(3),w(4),w(5),w(6)) \...
                f(w(1),w(2),w(3),w(4),w(5),w(6));
    w = w + deltaw;
end
x = [w(1:3);-w(3:-1:1)]
c = [w(4:6); w(6:-1:4)]

function y = f1(x1,x2,x3,c1,c2,c3)
    y = c1+c2+c3-1;
end
function y = f2(x1,x2,x3,c1,c2,c3)
    y = c1*x1^2 + c2*x2^2 + c3*x3^2 - 1/3;
end
function y = f3(x1,x2,x3,c1,c2,c3)
    y = c1*x1^4 + c2*x2^4 + c3*x3^4 - 1/5;
end
function y = f4(x1,x2,x3,c1,c2,c3)
    y = c1*x1^6 + c2*x2^6 + c3*x3^6 - 1/7;
end
function y = f5(x1,x2,x3,c1,c2,c3)
    y = c1*x1^8 + c2*x2^8 + c3*x3^8 - 1/9;
end
function y = f6(x1,x2,x3,c1,c2,c3)
    y = c1*x1^10 + c2*x2^10 + c3*x3^10 - 1/11;
end

function y = jacob(x1,x2,x3,c1,c2,c3)
    y = [
        0,0,0,1,1,1;
        2*c1*x1, 2*c2*x2, 2*c3*x3, x1^2, x2^2, x3^2;
        4*c1*x1^3, 4*c2*x2^3, 4*c3*x3^3, x1^4, x2^4, x3^4;
        6*c1*x1^5, 6*c2*x2^5, 6*c3*x3^5, x1^6, x2^6, x3^6;
        8*c1*x1^7, 8*c2*x2^7, 8*c3*x3^7, x1^8, x2^8, x3^8;
        10*c1*x1^9,10*c2*x2^9,10*c3*x3^9,x1^10,x2^10,x3^10;
    ];
end

function y = f(x1,x2,x3,c1,c2,c3)
    y = -[
        f1(x1,x2,x3,c1,c2,c3);
        f2(x1,x2,x3,c1,c2,c3);
        f3(x1,x2,x3,c1,c2,c3);
        f4(x1,x2,x3,c1,c2,c3);
        f5(x1,x2,x3,c1,c2,c3);
        f6(x1,x2,x3,c1,c2,c3);
    ];
end
