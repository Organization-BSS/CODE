//
//  ViewController.m
//  MyUITabbarController
//
//  Created by bss on 16/8/23.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController () {
    UILabel *la; // test bottom tabbar view content
    int i ;// increase numbers
    NSTimer *ssbTimer; // timer
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"done" forState:UIControlStateNormal];
    [self.view addSubview:button];
    i = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hit:(id)object {
    NSLog(@"hit");
}

- (void)pressed:(id)object {
    NSLog(@"pressed");
    
    [self startTimer];
}

// 倒计时
- (void)startTimer {
    ssbTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTimeLable:) userInfo:nil repeats:YES];
    [ssbTimer fire];
    [[NSRunLoop currentRunLoop]addTimer:ssbTimer forMode:NSRunLoopCommonModes];
}

// 倒计时method
- (void)changeTimeLable:(NSTimer *)timer {
    i++;
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    NSLog(@"%@",app.bottomView);
    NSString *sr = [NSString stringWithFormat:@"0:%d",i];
    if (!la) {
        la = [[UILabel alloc]initWithFrame:CGRectMake(-15, -5, 40, 15)];
        la.textAlignment = NSTextAlignmentCenter;
        la.backgroundColor = [UIColor greenColor];
    }
    [app.bottomView addSubview:la];

    if (i==11) {
        [ssbTimer invalidate];
        [app.bottomView setValue:@"我" forKey:@"text"];
        [la removeFromSuperview];
        i = 0;
    }
    
        la.text = sr;
}

@end
