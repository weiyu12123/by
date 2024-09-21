#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#define ARRAY_SIZE 10  // 固定数组长度为 10

int main() {
    float nums[ARRAY_SIZE];  // 定长数组
    float increment;  // 递增步长
    int i;

    // 输入第一个元素和递增步长
    scanf("%f", &nums[0]);  // 输入第一个元素
    scanf("%f", &increment);  // 输入递增的数（步长）

    // 生成递增序列
    for (i = 1; i < ARRAY_SIZE; i++) {
        nums[i] = nums[i - 1] + increment;  // 每个元素比前一个元素增加指定步长
    }

    // 输出数组的最后一个元素
    printf("%.2f\n", nums[ARRAY_SIZE - 1]);  // 输出最后一个元素

    return 0;
}
