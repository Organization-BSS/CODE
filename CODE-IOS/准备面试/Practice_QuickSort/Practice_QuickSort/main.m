//
//  main.m
//  Practice_QuickSort
//
//  Created by bss on 6/3/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuickSort.h"

void sort(int *a, int left, int right)
{
    if(left >= right)/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
    {
        return ;
    }
    int i = left;
    int j = right;
    int key = a[left];
    
    while(i < j)                               /*控制在当组内寻找一遍*/
    {
        while(i < j && key <= a[j])
        /*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
         序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
        {
            j--;/*向前寻找*/
        }
        
        a[i] = a[j];
        /*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
         a[left]，那么就是给key）*/
        
        while(i < j && key >= a[i])
        /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
         因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
        {
            i++;
        }
        
        a[j] = a[i];
    }
    
    a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
    sort(a, left, i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
    sort(a, i + 1, right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
    /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
}
// 快速排序算法
void quickSort(int *b,int left,int right) {
    if (left<0 || left>right) {
        return;
    }
    int i = left;     // 标记开始位置
    int j = right;    // 标记末尾位置
    int key = b[i];   // 选择分治的数据

    while (i < j) {
        while (i < j && key <= b[j]) {    // 首先从后往前寻找比制定数据值小的数据
            j--;
        }
        b[i] = b[j];
        
        while (i < j && key >= b[i]) {    // 首先从前往后寻找比制定数据值大的数据
            i++;
        }
        b[j] = b[i];
    }
    b[i] = key;
    quickSort(b, left, i-1);
    quickSort(b, i+1, right);
    return;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int b[8] = {76,34,32,15,89,36,78,45}; // 待排序的数组初始化
        quickSort(b, 0, 7);
        for (int m = 0; m <= 7; m++) {
            printf("%d\n",b[m]);
        }

//        return 0;
//        NSMutableArray * arr = [NSMutableArray arrayWithCapacity:0];
//        for (int i = 0; i< 8; i++) {
//            [arr addObject:[NSNumber numberWithInt:b[i]]];
//        }
//        QuickSort *quick = [[QuickSort alloc]init];
//     
//        NSMutableArray * arry = [quick quickSort:arr leftValue:0 rightValue:7];
//        for (NSObject  *object in arry){
//            NSLog(@"%@",object);
//        }
//        NSLog(@"Hello, World!");
        
    }
    return 0;
}
