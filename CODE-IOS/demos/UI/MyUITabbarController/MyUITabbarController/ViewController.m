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
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    NSLog(@"%@",app.bottomView);
    [app.bottomView setValue:@"我" forKey:@"text"];
    i++;
    NSString *sr = [NSString stringWithFormat:@"%d",i];
    if (!la) {
        
        la = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 10)];
        la.backgroundColor = [UIColor greenColor];
        [app.bottomView addSubview:la];
    } else {
    }
    la.text = sr;
    if (i == 5) {
        [app.bottomView setValue:@"我" forKey:@"text"];
        [la removeFromSuperview];
    }
    
}


@end
