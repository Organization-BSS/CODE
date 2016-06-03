//
//  MyGCD.h
//  Practice_MutipleThread_GCD
//
//  Created by bss on 5/30/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

/*
GCD的优势－－－－－－－－
 
 GCD是苹果公司为多核的并行运算提出的解决方案
 
 GCD会自动利用更多的CPU内核（比如双核、四核）
 
 GCD会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
 
 程序员只需要告诉GCD想要执行什么任务，不需要编写任何线程管理代码
 
任务和队列－－－－－－－－－
 GCD中有2个核心概念
 （1）任务：执行什么操作
 （2）队列：用来存放任务
 
队列－－－－－－－－－
 GCD的队列分为2大类型
 （1）并发队列（concurrent dispatch queue）
  可以让多个任务并发（同时）执行（自动开启多个线程同时执行任务）并发功能，只有在异步(dispatch_async)函数下才有效。
 （2）串行队列 (serial dispatch queue)
  让任务一个接一个执行
 
补充说明－－－－－－－－－
 4个术语：同步 异步 并发 串行
 
 同步和异步决定是不是要开启新线程
 同步：在当前线程中执行，不具备开启新线程的能力
 异步：在新线程中执行，具备开启新线程的能力
 
 并发和串行决定任务的执行方式
 并发：多个任务并发（同时）执行
 串行：一个任务执行后，再执行下一个任务
 
串行队列
 GCD中获得串行队列有2种途径
 （1）使用dispatch_queue_create 函数创建
 dispatch_queue_t  dispatch_queue_create(const char *label,  dispatch_queue_attr_t attr); // 队列名称， 队列属性，一般用NULL即可
 
 示例：
  dispatch_queue_t queue = dispatch_queue_create("wendingding", NULL); // 创建
 
 dispatch_release(queue); // 非ARC需要释放手动创建的队列
 （2）使用主队列（跟主线程相关联的队列）
  主队列是GCD自带的一种特殊的串行队列,放在主队列中的任务，都会放到主线程中执行
  使用dispatch_get_main_queue()获得主队列
  示例：
  dispatch_queue_t queue = dispatch_get_main_queue();
 
并发队列－－－－－－－
 
 GCD默认已经提供了全局的并发队列，供整个应用使用，不需要手动创建
  使用dispatch_get_global_queue函数获得全局的并发队列
 dispatch_queue_t dispatch_get_global_queue(dispatch_queue_priority_t priority,unsigned long flags); // 此参数暂时无用，用0即可
 
 示例：
  这个参数是留给以后用的，暂时用不上，传个0。
 第一个参数为优先级，这里选择默认的。获取一个全局的默认优先级的并发队列。
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); // 获得全局并发队列
 
 说明：全局并发队列的优先级
  #define DISPATCH_QUEUE_PRIORITY_HIGH 2 // 高
  #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0 // 默认（中）
  #define DISPATCH_QUEUE_PRIORITY_LOW (-2) // 低
  #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN // 后台
 
小结
 
 说明：同步函数不具备开启线程的能力，无论是什么队列都不会开启线程；异步函数具备开启线程的能力，开启几条线程由队列决定（串行队列只会开启一条新的线程，并发队列会开启多条线程）。
 
 同步函数
  （1）并发队列：不会开线程
  （2）串行队列：不会开线程
 
 异步函数
  （1）并发队列：能开启N条线程
  （2）串行队列：开启1条线程
 
 补充：
  凡是函数中，各种函数名中带有create\copy\new\retain等字眼，都需要在不需要使用这个数据的时候进行release。
 GCD的数据类型在ARC的环境下不需要再做release。
 CF（core Foundation）的数据类型在ARC环境下还是需要做release。
 异步函数具备开线程的能力，但不一定会开线程
 
GCD调度组
 有这么一个需要，分别执行2个耗时的异步操作，等2个异步操作都执行完毕后在回到主线程执行操作。如果想要快速高效地实现这个需求，可以考虑使用调度组。 调度组的创建代码如下：
 dispatch_group_t group = dispatch_group_create();
 dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, ^(void)block)
 第一个参数group是一个调度组，queue是一个异步队列，这里如果使用同步队列意义就不大了，不过还是能达到效果，第三个参数是一个执行代码块，任务都添加到该代码块里面。 往调度组里面添加任务并获得通知的代码如下
 //  群组－统一监控一组任务
 dispatch_group_t group = dispatch_group_create();
 
 dispatch_queue_t q = dispatch_get_global_queue(0, 0);
 // 添加任务
 // group 负责监控任务，queue 负责调度任务
 dispatch_group_async(group, q, ^{
 [NSThread sleepForTimeInterval:1.0];
 NSLog(@"任务1 %@", [NSThread currentThread]);
 });
 dispatch_group_async(group, q, ^{
 NSLog(@"任务2 %@", [NSThread currentThread]);
 });
 dispatch_group_async(group, q, ^{
 NSLog(@"任务3 %@", [NSThread currentThread]);
 });
 
 // 监听所有任务完成 － 等到 group 中的所有任务执行完毕后，"由队列调度 block 中的任务异步执行！"
 dispatch_group_notify(group, dispatch_get_main_queue(), ^{
 // 修改为主队列，后台批量下载，结束后，主线程统一更新UI
 NSLog(@"OK %@", [NSThread currentThread]);
 });
 
 NSLog(@"come here");
 
 GCD调度组中还有一个添加任务的函数： dispatch_group_enter(dispatch_group_t group) dispatch_group_leave(dispatch_group_t group) 这两个函数要配对出现 例如：
 
 // 群组－统一监控一组任务
 dispatch_group_t group = dispatch_group_create();
 
 dispatch_queue_t q = dispatch_get_global_queue(0, 0);
 
 // 1> 入组 -> 之后的 block 会被 group 监听
 // dispatch_group_enter 一定和 dispatch_group_leave 要配对出现
 dispatch_group_enter(group);
 dispatch_async(q, ^{
 NSLog(@"task1 %@", [NSThread currentThread]);
 
 // block 的末尾，所有任务执行完毕后，添加一个出组
 dispatch_group_leave(group);
 });
 
 //  再次入组
 dispatch_group_enter(group);
 dispatch_async(q, ^{
 [NSThread sleepForTimeInterval:1.0];
 
 NSLog(@"task2 %@", [NSThread currentThread]);
 
 // block 的末尾，所有任务执行完毕后，添加一个出组
 dispatch_group_leave(group);
 });
 
 // 群组结束
 dispatch_group_notify(group, dispatch_get_main_queue(), ^{
 NSLog(@"OVER");
 });
 NSLog(@"come here");
 
 
 代码执行的效果与刚才那种方式相同！ GCD中还有一个函数
 
 dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
 该函数是个阻塞式的等待，当我们将第二个参数设置为DISPATCH_TIME_FOREVER时，群组任务不执行完，后续代码就会无法执行，也就是说只要任务不执行完come here就不会打印。
 
 dispatch_apply
 执行某个代码片段若干次。
 dispatch_apply(10, globalQ, ^(size_t index) {
 // do sth. 10 times
 });
 
 dispatch_once
 它可以保证整个应用程序生命周期中某段代码只被执行一次！
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
 // code to be executed once
 });
 
 dispatch_after
 有时候我们需要等个几秒钟然后做个动画或者给个提示，这时候可以用dispatch_after这个函数：
 double delayInSeconds = 2.0;
 dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
 dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
 // code to be executed on the main queue after delay
 });
 
 dispatch_time
 或者说同步地等待一段时间看是否结束：
 dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
 dispatch_group_wait(group, time);
 
 dispatch_barrier_async
 通过dispatch_barrier_async函数提交的任务会等它前面的任务执行结束才开始，然后它后面的任务必须等它执行完毕才能开始。
 dispatch_async(concurrentQ, blk0);
 dispatch_async(concurrentQ, blk1);
 dispatch_barrier_async(concurrentQ, blk_barrier);
 dispatch_async(concurrentQ, blk2);
 */
#import <Foundation/Foundation.h>

@interface MyGCD : NSObject

// test 入口
- (void)test_GCD;

@end
