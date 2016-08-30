//
//  FirstViewController.m
//  Demo_UI_UITabBarController
//
//  Created by bss on 16/8/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor redColor];
    NSObject *object = [[[[UIApplication sharedApplication]delegate]window]rootViewController].view;
    NSLog(@"%@",object);
    NSLog(@"%@",self.view);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidAppear:(BOOL)animated {
    NSObject *object = [[[[UIApplication sharedApplication]delegate]window]rootViewController].view;
    NSLog(@"%@",object);
    NSLog(@"%@",self.view);
}
@end
