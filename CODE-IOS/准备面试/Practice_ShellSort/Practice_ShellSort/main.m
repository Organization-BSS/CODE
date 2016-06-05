//
//  main.m
//  Practice_ShellSort
//
//  Created by bss on 6/5/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 排序算法－希尔排序
 */
void shellSort(int *p,int count) {
    int d = count/2;  // 初始增量，以后逐次减半
    int i,j,x;        // 待使用的变量
    
    while (d >=1) {   // 按照增量循环，当增量等于1的时候，排序完成
        for (i = d; i < count; i++) {
            x = p[i]; // 获取增量分组的第二个数
            j = i-d;  // 在同一组内的前一个数据序号
            for (;j >= 0 && x < p[j]; j-=d) {
                p[j+d] = p[j];  // 向后移动位置
            }
        // 将数据放到该位置，是因为在上面for循环中j-=d,所以要先j+d,在放置数据
            p[j+d] = x;
        }
        d/=2;          // 缩减增量
        
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // test shellSort
        int a[9] = {13,235,34,1,235,25,56,34,78};
        shellSort(a, 9);
        
        for (int i = 0; i < 9; i++) {
            printf("%d  ",a[i]);
        }
    }
    return 0;
}
