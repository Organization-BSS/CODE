//
//  GcdFactory.m
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "GcdFactory.h"
#import "Practice_GCD.h"

@implementation GcdFactory

- (BaseClass_Multi_Thread *)getThreadClass {
    return [Practice_GCD new];
}
@end
