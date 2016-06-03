//
//  ViewController.m
//  Practice_MutipleThread
//
//  Created by bss on 4/21/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"
#import "BaseClass_Multi-Thread.h"
#import "ThreadFactoryInterface.h"
#import "NSThreadFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    BaseClass_Multi_Thread *threadTest = nil;
    id <ThreadFactoryInterface> factory = nil;
    
    // test NSThread
    factory = [NSThreadFactory new];
    
    threadTest = [factory getThreadClass];
    [threadTest run];
    
}

@end
