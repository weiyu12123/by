#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
    int i, n;
    long long f = 1; 

    // 输入
    printf("请输入一个非负整数 n: ");
    if (scanf("%d", &n) != 1) { 
        printf("输入无效\n");
        return 1; 
    }

   
    if (n < 0) {
        printf("阶乘未定义（n 应为非负整数）\n");
        return 1; 
    }

    i = 2;
    while (i <= n) {
        f *= i; 
        i++;    
    }

    // 输出结果
    printf("结果是: %lld\n", f); 

    return 0;
}
