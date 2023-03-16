#include <stdio.h>

void insertionSort(float arr[], int n)
{
    for (int i = 1; i < n; i++)
    {
        float curr = arr[i];
        int j = i - 1;
        for (; j >= 0 && arr[j] > curr; j--)
        {
            arr[j + 1] = arr[j];
        }
        arr[j + 1] = curr;
    }
}

void bucketSort(float arr[], int n, float bucket[])
{
    float b[n][n];
    int index[n];
    for (int i = 0; i < n; i++)
    {
        index[i] = 0;
    }
    for (int i = 0; i < n; i++)
    {
        int x_index = n * arr[i];
        b[x_index][index[x_index]++] = arr[i];
    }

    for (int i = 0; i < n; i++)
    {
        insertionSort(b[i], index[i]);
    }

    int k = 0;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < index[i]; j++)
        {
            bucket[k++] = b[i][j];
        }
    }
}

int main()
{
    int n = 12;
    float arr[] = {0.342, 0.648, 0.3656, 0.6921, 0.2, 0.4, 0.1, 0.256, 0.565, 0.66, 0.112, 0.595, 0.3434, 0.161, 0.554};
    float bucket[n];

    bucketSort(arr, n, bucket);
    for (int i = 0; i < n; i++)
    {
        printf("%f\n", bucket[i]);
    }
    return 0;
}