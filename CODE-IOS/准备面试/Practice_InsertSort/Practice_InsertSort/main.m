//
//  main.m
//  Practice_InsertSort
//
//  Created by bss on 6/5/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 排序算法－－直接插入排序
*/
void insertSort(int *p,int count) {
    int i,j,k;
    for (i = 1; i < count; i++) {
        k = p[i];                               // 取出一个未排序的数据
        for (j = i-1; j>-1 && k < p[j]; j--)    // 再数组中查找位置
            p[j+1] = p[j];                      // 向后移动数据
        p[j+1] = k;                             // 插入数据
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        // test insetSort
        int p[8] = {12,34,2,54,23,3,6,89};
        insertSort(p,8);
        for (int i = 0; i<8; i++) {
            printf("%d ",p[i]);
            }
    }
    return 0;
}
