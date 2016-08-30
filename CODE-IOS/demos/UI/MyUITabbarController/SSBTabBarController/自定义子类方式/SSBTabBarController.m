//
//  SSBTabBarController.m
//  MyUITabbarController
//
//  Created by bss on 16/8/23.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "SSBTabBarController.h"
#import "SSBTabBar.h"
#import "ViewController.h"

@interface SSBTabBarController ()

@end

@implementation SSBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChildViewController];
    [self setSSBTabBar];
    
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

#pragma mark - instance method

#pragma mark - 创建TabBarController的4个子控制器
// 封装创建TabBarController的4个子控制器的方法
- (void)setupChildViewController {
    UIViewController *v1 = [[ViewController alloc]init];
    UIViewController *v2 = [[ViewController alloc]init];
    UIViewController *v3 = [[ViewController alloc]init];
    UIViewController *v4 = [[ViewController alloc]init];

    
    // 添加四个TabBarController的子控制器UINavigationController
    // 首页Home
    
    [self setupOneChildViewController:v1 image:[UIImage imageNamed:@"tabBar_essence_icon"] selectedImage:[UIImage imageNamed:@"tabBar_essence_click_icon"] title:@"首页"];
    
    // 消息message
    [self setupOneChildViewController:v2 image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] title:@"消息"];
    
    // 发现discover

    [self setupOneChildViewController:v3 image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] title:@"发现"];
    
    // 我profile
    [self setupOneChildViewController:v4 image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] title:@"我"];
    
    // 添加到tabBar
    self.viewControllers = @[v1, v2, v3, v4];
    
}

#pragma mark - 创建一个子控制器的方法
// 封装创建一个子控制器的方法
- (void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.tabBarItem.badgeValue = @"10";
    vc.tabBarItem.title = title;
}



// set tabbar using kvc
- (void)setSSBTabBar {
    
    SSBTabBar *ssbTabBar = [[SSBTabBar alloc]initWithFrame:self.tabBar.frame];
    [self setValue:ssbTabBar forKeyPath:@"tabBar"];
}

@end
