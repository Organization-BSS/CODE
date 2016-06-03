//
//  NSThreadFactory.m
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "NSThreadFactory.h"
#import "Practice_NSThread.h"

@implementation NSThreadFactory

- (BaseClass_Multi_Thread *)getThreadClass {
    return [Practice_NSThread new];
}

@end
