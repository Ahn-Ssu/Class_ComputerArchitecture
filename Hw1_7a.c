#include <stdio.h>

int findMax(int integerArray[], int N);

int main()
{
    int arr[] = {1, 2, 3, 4, 5, 6, 9, 7, 14, 8};
    int n = sizeof(arr) / 4;

    printf("max ==> %d", findMax(arr, n));

    return 0;
}

int findMax(int integerArray[], int N)
{
    int max = integerArray[0];

    for (int i = 0; i < N; i++)
    {
        if (max < integerArray[i])
        {
            max = integerArray[i];
        }
    }
    // printf("the largest number = %d",max);

    return max;
}