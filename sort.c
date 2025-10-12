#include <stddef.h>

extern void swap(double *a, double *b);

void sort(double *arr, long len) {
    if (len <= 1) return;
    for (long i = 0; i < len - 1; ++i) {
        for (long j = 0; j < len - 1 - i; ++j) {
            if (arr[j] > arr[j + 1]) {
                swap(&arr[j], &arr[j + 1]);
            }
        }
    }
}