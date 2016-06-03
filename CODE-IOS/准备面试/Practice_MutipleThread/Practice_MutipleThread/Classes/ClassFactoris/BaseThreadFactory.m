//
//  BaseThreadFactory.m
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "BaseThreadFactory.h"
#import "BaseClass_Multi-Thread.h"

@implementation BaseThreadFactory

- (BaseClass_Multi_Thread *)getThreadClass {
    return [BaseClass_Multi_Thread new];
}
@end
