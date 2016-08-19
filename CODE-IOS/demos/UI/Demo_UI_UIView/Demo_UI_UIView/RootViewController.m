//
//  RootViewController.m
//  ProjectModel
//
//  Created by bss on 16/8/18.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "SSBView.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    SSBView *ssbView = [[SSBView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    ssbView.backgroundColor = [UIColor yellowColor];
    
    [[[[UIApplication sharedApplication]delegate]window].rootViewController.view addSubview:ssbView];
//    self.view.backgroundColor = [UIColor redColor];
    [ssbView test];
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

@end
