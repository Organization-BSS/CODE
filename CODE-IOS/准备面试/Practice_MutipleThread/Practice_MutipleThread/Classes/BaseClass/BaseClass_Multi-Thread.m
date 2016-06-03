//
//  BaseClass_Multi-Thread.m
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "BaseClass_Multi-Thread.h"

@implementation BaseClass_Multi_Thread

- (void)run {
    NSLog(@"%@", NSStringFromClass([self class]));
}
@end
