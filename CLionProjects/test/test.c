#include<stdio.h>
#include<math.h>

#define FLAG 200

int two_divide(double a, double b, double c, double d, double m, double n) {
    double k;
    if (m > 100) {
        printf("%.2lf ", n);
        return 0;
    }
    if (n > 100) {
        printf("%.2lf ", m);
        return 0;
    }
    while (n - m >= 0.0001) {
        k = (m + n) / 2.0;
        double x = a * m * m * m + b * m * m + c * m + d;
        double y = a * k * k * k + b * k * k + c * k + d;
        if (x * y < 0.0) n = k;
        else m = k;
    }

    printf("%.2lf ", m);
    return 0;

}

int main() {
    double a, b, c, d;
    int root_integer[3][2] = {FLAG, FLAG, FLAG, FLAG, FLAG, FLAG};  //3对整数
    int i, k = 0;
    scanf("%lf%lf%lf%lf", &a, &b, &c, &d);
    for (i = -100; i < 100 && k < 3; i++) {
        double m = a * i * i * i + b * i * i + c * i + d;
        double n = a * (i + 1) * (i + 1) * (i + 1) + b * (i + 1) * (i + 1) + c * (i + 1) + d;
        if (m * n < 0.0) {
            root_integer[k][0] = i;
            root_integer[k++][1] = i + 1;
        }
        if (abs(m) < 0.0001) root_integer[k++][0] = i;
        if (abs(n) < 0.0001) root_integer[k++][1] = ++i;
    }
    two_divide(a, b, c, d, (double) root_integer[0][0], (double) root_integer[0][1]);
    two_divide(a, b, c, d, (double) root_integer[1][0], (double) root_integer[1][1]);
    two_divide(a, b, c, d, (double) root_integer[2][0], (double) root_integer[2][1]);
    return 0;
}
