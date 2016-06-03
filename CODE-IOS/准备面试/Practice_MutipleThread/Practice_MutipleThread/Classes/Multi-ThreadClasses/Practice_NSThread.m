//
//  Practice_NSThread.m
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "Practice_NSThread.h"

@implementation Practice_NSThread

// test NSThread
- (void)run {
    
    [super run];
    
    // 初始化操作
    lock = [[NSLock alloc]init];
    numbers = 0;
    
    // 通过detach方法开启新线程，但是这样开启线程，线程没有任何的名称
    [NSThread detachNewThreadSelector:@selector(logNumbers:) toTarget:self withObject:self];
    [NSThread detachNewThreadSelector:@selector(logNumbers:) toTarget:self withObject:self];
    
    // 取消下面的处理操作
    return;
    // 通过一般的oc创建对象的方式创建新线程
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(logNumbers3:) object:nil];
    
    // 设置线程名称
    thread.name = @"the third thread";
    
    // 开启线程
    [thread start];

    // 判断是否为主线程
    NSString *isMainThread = ([NSThread isMainThread]? @"is main thread" : @"this is not the main thread");
    NSLog(@"%@",isMainThread);
    
    // 判断是否为多线程，我的理解是当前应用程序是否开启多个线程
    NSLog(@"%@",([NSThread isMultiThreaded]? @"this is MutiThreaded": @"this is not MutiThreaded"));
    
    // 暂停当前线程
    [NSThread sleepForTimeInterval:2];
    
    // 通过for循环，运行主线程
    for (int i = 0; i<1000; i++) {
        NSLog(@"this Thread is: %@, %i",[NSThread currentThread],i);
    }
}

// 打印数字第一组
- (void)logNumbers:(id)object {
    
    @synchronized(self) {
        
        // 测试 threadDictionary property
        NSLog(@"threadDictionary is:%@",[[NSThread currentThread]threadDictionary]);
        
        // 测试executing 属性
        NSLog(@"cureent thread is executing:%@",([[NSThread currentThread] isExecuting]? @"正在执行": @"没有在执行"));
        
        // 通过for循环测试开启新线程与主线程之间的顺序
        for (int i = 0; i<100; i++) {
            numbers++;
            
            NSLog(@"第一组打印所在的线程 is: %@, %li",[NSThread currentThread],(long)numbers);
                   }

    }
 
//    [lock lock];
//    // 设置优先级
//    [NSThread setThreadPriority:1.0];
//    
//    // 测试 threadDictionary property
//    NSLog(@"threadDictionary is:%@",[[NSThread currentThread]threadDictionary]);
//    
//    // 测试executing 属性
//    NSLog(@"cureent thread is executing:%@",([[NSThread currentThread] isExecuting]? @"正在执行": @"没有在执行"));
//    
//    // 通过for循环测试开启新线程与主线程之间的顺序
//    for (int i = 0; i<100; i++) {
//        numbers++;
//        
//        NSLog(@"第一组打印所在的线程 is: %@, %i",[NSThread currentThread],numbers);
//        
//       
//        
//        // 测试退出当前线程操作
////        [NSThread exit]; // 取消当前线程
//        
//    }
//    [lock unlock];
}

// 打印数字第二组
- (void)logNumbers2:(id)object {
    
    // 设置优先级
    [NSThread setThreadPriority:0.30];
    
    // 通过for循环测试开启线程与线程之间的发生顺序
    for (int i = 0; i<1000; i++) {
        NSLog(@"第二组打印所在的线程 is: %@, %i",[NSThread currentThread],i);
    }
    
}

// 打印数字第三组
- (void)logNumbers3:(id)object {
    
    // 设置优先级
    [NSThread setThreadPriority:0.30];
    
    // 通过for循环测试开启线程与线程之间的发生顺序
    for (int i = 0; i<1000; i++) {
        NSLog(@"第三组打印所在的线程 is: %@, %i",[NSThread currentThread],i);
        
        if (i == 300) {
            // 取消当前线程，貌似不起作用啊
            [[NSThread currentThread]cancel];
        }
    }
}

// 打印数字第四组
- (void)logNumbers4:(id)object {
    NSLog(@"object:%@",object);
    // 通过for循环测试开启线程与线程之间的发生顺序
    for (int i = 0; i<1000; i++) {
        NSLog(@"第四组打印所在的线程 is: %@, %i",[NSThread currentThread],i);
    }
}
@end
