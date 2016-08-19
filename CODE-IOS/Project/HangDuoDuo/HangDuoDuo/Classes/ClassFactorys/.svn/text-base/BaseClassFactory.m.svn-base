//
//  BaseClassFactory.m
//  Hangduoduo
//
//  Created by bss on 16/7/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "BaseClassFactory.h"
#import <objc/message.h>
#import <objc/runtime.h>

@implementation BaseClassFactory

//  根据类名返回对应的类
+ (id)objectWithClassName:(NSString *)className {

    // 通过runtime 机制创建类对象
    Class class = NSClassFromString(className);
    id  obj = ((id (*)(id,SEL))objc_msgSend)(class,@selector(alloc));
    id object = ((id (*)(id,SEL))objc_msgSend)(obj,NSSelectorFromString(@"init"));
    
    return object;
    
}
@end
