#include<cstdio>
#include<cstdlib>
#include<ctime>
#include<memory.h>
#include<cmath>

int a[1000][1000];
int p = 0, q = 0;
int times;
int start_i, start_j;

int saw(int N, int i0, int count, int i, int j){
    a[i][j] = 1;

    if(count == N - i0){
        p = (i - start_i) * (i - start_i) + (j - start_j) * (j - start_j);
    }
    if(count == N + i0){
        q = (i - start_i) * (i - start_i) + (j - start_j) * (j - start_j);
        a[i][j] = 0;
        return 1;
    }
    int flag0 = 1, flag1 = 1, flag2 = 1, flag3 = 1;
    int result;
    while(flag0 || flag1 || flag2 || flag3){
        int ran;
        ran = rand() % 4;
        if(ran == 0 && flag0){
            if(i - 1 >= 0 && j >= 0 && i - 1 <= 999 && j <= 999 && a[i - 1][j] == 0){
                putchar('0');
                result = saw(N, i0, count + 1, i - 1, j);
            }
            if(result == 1){
                a[i][j] = 0;
                return 1;
            }
            else printf("-0");
            flag0 = 0;
        }
        if(ran == 1 && flag1){
            if(i + 1 >= 0 && j >= 0 && i + 1 <= 999 && j <= 999 && a[i + 1][j] == 0){
                putchar('1');
                result = saw(N, i0, count + 1, i + 1, j);
            }
            if(result == 1){
                a[i][j] = 0;
                return 1;
            }
            else printf("-1");
            flag1 = 0;
        }
        if(ran == 2 && flag2){
            if(i >= 0 && j - 1 >= 0 && i <= 999 && j - 1 <= 999 && a[i][j - 1] == 0){
                putchar('2');
                result = saw(N, i0, count + 1, i, j - 1);
            }
            if(result == 1){
                a[i][j] = 0;
                return 1;
            }
            else printf("-2");
            flag2 = 0;
        }
        if(ran == 3 && flag3){
            if(i >= 0 && j + 1 >= 0 && i <= 999 && j + 1 <= 999 && a[i][j + 1] == 0){
                putchar('3');
                result = saw(N, i0, count + 1, i, j + 1);
            }
            if(result == 1){
                a[i][j] = 0;
                return 1;
            }
            else printf("-3");
            flag3 = 0;
        }
    }
    a[i][j] = 0;
    return 0;
}

int main(){
    int k = 0, n;
    int N, i0;
    float avr_p = 0, avr_q = 0;
    srand((unsigned int) time(nullptr));
    printf("Input:N,i0,start_i,start_j,times\n");
    scanf("%d%d%d%d%d", &N, &i0, &start_i, &start_j, &times);
    int times0 = times;
    while(times--){
        for(int i = 0; i < 1000; i++)
            for(int j = 0; j < 1000; j++)
                a[i][j] = 0;
        if(saw(N, i0, 0, start_i, start_j)){
            printf("\n%d: p = %d, q = %d\n\n", times0-times, p, q);
            avr_p += p;
            avr_q += q;
        }
    }
    printf("times0=%d\n", times0);
    avr_p /= (float) times0;
    avr_q /= (float) times0;
    double v = 0.5 * log(avr_q / avr_p) / log((double) (N + i0) / (N - i0));
    printf("v(N)=%.7f\n", v);

}