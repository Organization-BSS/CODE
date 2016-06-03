//
//  Practice_NSThread.h
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseClass_Multi-Thread.h"

@interface Practice_NSThread : BaseClass_Multi_Thread {
    NSLock *lock;
    NSInteger numbers;
}
@end
