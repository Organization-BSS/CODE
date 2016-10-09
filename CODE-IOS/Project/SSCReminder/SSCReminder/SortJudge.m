//
//  SortJudge.m
//  SSCReminder
//
//  Created by bss on 16/10/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SortJudge.h"

@implementation SortJudge

+ (BOOL)reminderUserWithData:(NSArray *)array sortSize:(NSInteger)size {
    BOOL alert = NO;
    if (size < array.count) {
        int j = 0;
        NSMutableArray *arr_w = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *arr_q = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *arr_b = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *arr_s = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray *arr_g = [[NSMutableArray alloc]initWithCapacity:0];
        
        for (NSArray *ar in array) {
            j++;
            [arr_w addObject:[ar objectAtIndex:0]];
            [arr_q addObject:[ar objectAtIndex:1]];
            [arr_b addObject:[ar objectAtIndex:2]];
            [arr_s addObject:[ar objectAtIndex:3]];
            [arr_g addObject:[ar objectAtIndex:4]];
            
            if (j==size) {
                break;
            }
        }
        alert = [[self class] sortJudge:arr_w]||[[self class] sortJudge:arr_q]||[[self class] sortJudge:arr_b]||[[self class] sortJudge:arr_s]||[[self class] sortJudge:arr_g];
    }
 
    return alert;
    
}

+ (BOOL)sortJudge:(NSArray *)array {
    return ([[self class] bigSort:array]||[[self class] smallSort:array]||[[self class] doubleSort:array]||[[self class] oddSort:array]);
}
/**
 array 的格式为[@"1",@"2",@"6"...],最新出来的显示在第一位
 */


+ (BOOL)bigSort:(NSArray *)array {
    BOOL allBig = YES;
    for (int j = 0; j<array.count; j++) {
        NSString  *number = [array objectAtIndex:j];
        NSInteger number_I = [number integerValue];
        if (number_I < 5) {
            allBig =NO;
            return allBig;
        }
    }
    return allBig;
    
}

+ (BOOL)smallSort:(NSArray *)array {
    BOOL allTrue = YES;
    for (NSString * numberString in array) {
        NSInteger number = [numberString integerValue];
        if (number > 4) {
            allTrue = NO;
            return allTrue;
        }
    }
    return allTrue;

}

+ (BOOL)doubleSort:(NSArray *)array {
    BOOL allTrue = YES;
    for (NSString * numberString in array) {
        NSInteger number = [numberString integerValue];
        if (number %2 == 0) {
            allTrue = NO;
            return allTrue;
        }
    }
    return allTrue;
}

+ (BOOL)oddSort:(NSArray *)array {
    BOOL allTrue = YES;
    for (NSString * numberString in array) {
        NSInteger number = [numberString integerValue];
        if (number %2 != 0) {
            allTrue = NO;
            return allTrue;
        }
    }
    return allTrue;
}
@end
