//
//  ViewController.m
//  Practice_NSOperationQu
//
//  Created by bss on 5/28/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"heloo");
        for (int i = 0; i< 1111; i++) {
            NSLog(@"%d",i);
            [queue setSuspended:YES];

//                if (i == 400) {
//                    [[NSOperationQueue currentQueue] cancelAllOperations];
//                }
        }
    }];
    [blockOperation addExecutionBlock:^{
        for (int j = 0; j < 200; j++) {
            NSLog(@"this is addExecutionBlock %d",j);
        }
    }];
    
    [blockOperation addExecutionBlock:^{
        for (int j = 0; j < 5500; j++) {
            NSLog(@"this is %d",j);
        }
    }];
    NSBlockOperation *blockOperation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"heloo");
        for (int i = 0; i< 1111; i++) {
            NSLog(@"heloo%d",i);
            
            
        }
    }];
    [queue setMaxConcurrentOperationCount:1];  // 设置并发执行的任务数
    [queue addOperation:blockOperation];
    [queue addOperation:blockOperation2];
    blockOperation2 = nil;
    blockOperation = nil;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
