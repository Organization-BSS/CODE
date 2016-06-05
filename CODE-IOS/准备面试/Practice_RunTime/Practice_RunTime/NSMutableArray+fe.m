//
//  NSMutableArray+fe.m
//  Practice_RunTime
//
//  Created by bss on 6/4/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "NSMutableArray+fe.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSMutableArray (fe)

+ (void)load {
    
    Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"@__NSArrayM"), @selector(addObject:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"@__NSArrayM"), @selector(gp_addObject:));
    
    /* 交换方法的实现*/
    method_exchangeImplementations(orginalMethod, newMethod);
}

// 自己写的方法实现
- (void)gp_addObject:(id)object {
    if (object != nil) {
        [self gp_addObject:object];
    }
   
}
@end
