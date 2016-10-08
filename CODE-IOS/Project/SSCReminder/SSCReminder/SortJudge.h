//
//  SortJudge.h
//  SSCReminder
//
//  Created by bss on 16/10/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortJudge : NSObject

// 根据给定的数组，已经给定的数量进行排序
+ (BOOL)reminderUserWithData:(NSArray *)array sortSize:(NSInteger)size;
@end
