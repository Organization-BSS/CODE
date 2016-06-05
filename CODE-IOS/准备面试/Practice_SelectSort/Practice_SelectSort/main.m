//
//  main.m
//  Practice_SelectSort
//
//  Created by bss on 6/4/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  排序算法－选择排序
 *  这种方法类似我们人为的排序习惯：从数据中选择最小的同第一个值交换，在从剩下的部分中选择最小的与第二个交换，这样往复下去。
 *  @param p     待排序的数组
 *  @param count 数组的个数
 */
void selectSort(int *p,int count) {
    int temple; // 临时存放
    for (int i = 0; i < count -1; i++) {
        for (int j = i+1; j<count; j++)
            if (p[j]<p[i]) {
                temple = p[i];
                p[i] = p[j];
                p[j] = temple;
            }
        for (int m = 0; m < count; m++) {
            printf("%d ",p[m]);
        }
        printf("\n");
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        int p[9] = {12,34,3,54,5,123,45,36,67};
        selectSort(p, 9);
    }
    return 0;
}
