//
//  QuickSort.h
//  Practice_QuickSort
//
//  Created by bss on 6/3/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuickSort : NSObject

// 快速排序
- (NSMutableArray *)quickSort:(NSMutableArray *)array leftValue:(NSInteger)left rightValue:(NSInteger)right;
@end
