#include <stdio.h>

int findMax(int integerArray[], int N);

int main()
{
    int arr[] = {1, 2, 3, 4, 5, 6, 9, 7, 13, 8};
    int n = sizeof(arr) / 4;

    printf("max ==> %d", findMax(arr, n));

    return 0;
}

int findMax(int integerArray[], int N)
{
    int max, temp;

    if (N == 1)
    {
        return integerArray[0];
    }
    else
    {
        temp = findMax(integerArray, N - 1);
        max = integerArray[N - 1] > temp ? integerArray[N - 1] : temp;
        return max;
    }
}