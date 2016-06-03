//
//  BaseClass_Multi-Thread.h
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,MutiThreadType) {
    MutiThread_NSThread,    // NSThread
    MutiThread_NSOperation, // NSOpeation
    MutiThread_GCD          // GCD
};

@interface BaseClass_Multi_Thread : NSObject

- (void)run;
@end
