//
//  main.m
//  Practice_BubbleSort
//
//  Created by bss on 6/3/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 排序算法之冒泡排序
 */
/**
 *
 *
 *  @param a      geg
 *  @param length ge
 */
void bubbleSort(int *a,int length) {
    int temple ; // 定义临时变量
    for (int i = 0; i<length-1; i++) {
        for (int j = 0; j < length -i-1; j++) {
            if (a[j] > a[j+1]) {
                temple = a[j+1];
                a[j+1] = a[j];
                a[j] = temple;
            }
        }
        for (int i = 0 ; i< length ; i++) {
            printf("%d ",a[i]);
        }
        printf("\n");

    }
}

void bubbleSort2(int *a,int length) {
    int temple ; // 定义临时变量
    for (int i = 0; i<length-1; i++) {
        for (int j = length-1; j >i ; j--) {
            if (a[j] < a[j-1]) {
                temple = a[j];
                a[j] = a[j-1];
                a[j-1] = temple;
            }
        }
        for (int i = 0 ; i< length ; i++) {
            printf("%d ",a[i]);
        }
        printf("\n");
        
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        int a[8] = {12,34,3,78,203,45,123,13};
        bubbleSort(a,8);
    }
    return 0;
}
