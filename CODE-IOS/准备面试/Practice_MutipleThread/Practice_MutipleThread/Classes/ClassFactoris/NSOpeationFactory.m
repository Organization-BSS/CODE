//
//  NSOpeationFactory.m
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "NSOpeationFactory.h"
#import "Practice_NSOperation.h"

@implementation NSOpeationFactory
- (BaseClass_Multi_Thread *)getThreadClass {
    return [Practice_NSOperation new];
}

@end
