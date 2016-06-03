//
//  BaseThreadFactory.h
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseClass_Multi_Thread;

@interface BaseThreadFactory : NSObject

- (BaseClass_Multi_Thread *)getThreadClass;
@end
