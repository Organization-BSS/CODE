//
//  SSCSetUp.h
//  SSCReminder
//
//  Created by bss on 16/10/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSUInteger SSCTYPE;

NS_ENUM(SSCTYPE) {
    SSCTYPE_CQ,
    SSCTYPE_XJ
        };

@interface SSCSetUp : NSObject
@property (nonatomic,assign)NSInteger secondInterval; //设置间隔多长时间进行网络请求
@property (nonatomic,assign)SSCTYPE sscType; // 设置类型
@property (nonatomic,assign)NSInteger  reminderSize; // 提醒的数量
- (void)setup;

@end
