#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#define ARRAY_SIZE 10  // �̶����鳤��Ϊ 10

int main() {
    float nums[ARRAY_SIZE];  // ��������
    float increment;  // ��������
    int i;

    // �����һ��Ԫ�غ͵�������
    scanf("%f", &nums[0]);  // �����һ��Ԫ��
    scanf("%f", &increment);  // �������������������

    // ���ɵ�������
    for (i = 1; i < ARRAY_SIZE; i++) {
        nums[i] = nums[i - 1] + increment;  // ÿ��Ԫ�ر�ǰһ��Ԫ������ָ������
    }

    // �����������һ��Ԫ��
    printf("%.2f\n", nums[ARRAY_SIZE - 1]);  // ������һ��Ԫ��

    return 0;
}
