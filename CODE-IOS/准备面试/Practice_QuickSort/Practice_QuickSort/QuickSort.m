//
//  QuickSort.m
//  Practice_QuickSort
//
//  Created by bss on 6/3/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort
// 快速排序
- (NSMutableArray *)quickSort:(NSMutableArray *)array leftValue:(NSInteger)left rightValue:(NSInteger)right {
    if (left<0 || left>right) {
        return nil;
    }
    NSMutableArray * ar = array;
    int i = (int)left;
    int j = (int)right;
    int key = [[array objectAtIndex:left]intValue];
    
    while (i < j) {
        while (i < j && key <= [[array objectAtIndex:j] intValue]) {
            j--;
        }
        [ar setObject:[array objectAtIndex:j] atIndexedSubscript:i];

        while (i < j && key >= [[array objectAtIndex:i] intValue]) {
            i++;
        }
        [ar setObject:[array objectAtIndex:i] atIndexedSubscript:j];
    }
    [ar setObject:[NSNumber numberWithInt:key] atIndexedSubscript:j];

    [self quickSort:ar leftValue:left rightValue:i-1];
    [self quickSort:ar leftValue:i+1 rightValue:right];
    return ar;
}
@end

