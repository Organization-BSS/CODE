//
//  MyGCD.m
//  Practice_MutipleThread_GCD
//
//  Created by bss on 5/30/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import "MyGCD.h"

@implementation MyGCD

// test 入口
- (void)test_GCD {
    
    // 创建串行队列
    //dispatch_queue_t queue = dispatch_queue_create("com.bss", NULL);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    // 向队列中添加一个任务
    dispatch_async(queue, ^{
        for (int i = 0; i< 1000; i++) {
            NSLog(@"this task one:%d",i);
        }
    });
    
    // 向队列中添加一个任务
    dispatch_async(queue, ^{
        for (int i = 0; i< 1000; i++) {
            NSLog(@"this task second:%d",i);
        }
    });
}
@end
