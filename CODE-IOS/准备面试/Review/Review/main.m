//
//  main.m
//  Review
//
//  Created by bss on 6/1/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>

// 求最大值和最小值的问题
int getNumbers() {
    int c = 7902;                         // 差值
    int x ;                               // x为4位数
    int y ;                               // x的逆
    int m = 0;                            // 最大值
    int n = 0;                            // 最小值
    int number = 0;                       // 标记次数

    int i,j,k,l;                          // 分别代表四位数每个位的数值，
    i = 1;                                // 经推理分析千位数只能为 1
    l = i + 8;                            // 千位数和个位数的关系
    
    for (j = 0; j < 10; j++) {
            k = j-1;
            if(k < 0)
                k = 0 - k;
            
            x = i*1000 + j*100 + k*10 + l; // x's value
            y = l*1000 + k*100 + j*10 + i; // x's 逆
            if (y - x == c) {
                printf("这个四位数：%d %d %d %d\n",i,j,k,l);
                number ++;
                if (number == 1) {      // 标记第一次的值为最大和最小值
                    m = x;
                    n = x;
                }
                else {
                    if (m < x) {
                        m = x;         // 设置较大者为最大值
                    }else {
                        n = x;         // 设置较小者为最小值
                    }
                }
        }
    }
    printf("最大值为:%d\n",m);           // 最大值为:1989
    printf("最小值为:%d\n",n);           // 最小值为:1109
    return 0;
}

// 砝码的问题
int heightOfItem() {
    
    int j = 1;  // 假设待测的重量为1可知，必定有重量为1的砝码
    int k=0,l=0,m=0 ; // 分别为剩下三块的重量
    
    for (int h = 2;h<41;h++) {
        if ((k==0)&&(h>j)) {                 // 计算第二块的重量
            k = j+h;
        }
        
        if ((k!=0)&&(l == 0)&&(h>k+j)) {     // 计算第三块的重量
            l = h+k+j;
        }
        
        if ((l!=0)&&(m == 0)&&(h>k+j+l)) {   // 计算第四块的重量
            m = h+k+j+l;
        }
    }
    printf("%d,%d,%d,%d\n",j,k,l,m);        // 结果为：1，3，9，27
        return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       getNumbers();
        heightOfItem();
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
