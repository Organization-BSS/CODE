//
//  ThreadFactoryInterface.h
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseClass_Multi_Thread;

@protocol ThreadFactoryInterface <NSObject>

@required
// 返回多线程抽象类的抽象工厂的方法
- (BaseClass_Multi_Thread*)getThreadClass;

@end
