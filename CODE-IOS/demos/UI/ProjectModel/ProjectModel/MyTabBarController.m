//
//  MyTabBarController.m
//  Demo_UI_UITableViewController
//
//  Created by bss on 16/8/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    self.tabBar.hidden = YES;
//    self.tabBar.backgroundColor = [UIColor yellowColor];
//    [self.tabBar removeFromSuperview];
    
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeCustom];
    bu.backgroundColor = [UIColor whiteColor];
    CGSize size = [[UIScreen mainScreen]bounds].size;
    bu.frame = CGRectMake(0, 0, size.width, 49);
    [bu setTitle:@"mybey" forState:UIControlStateNormal];
    [bu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpOutside];
    self.view.userInteractionEnabled = YES;
    
    [self.tabBar addSubview:bu];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)click:(id)object {
    NSLog(@"click");
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
