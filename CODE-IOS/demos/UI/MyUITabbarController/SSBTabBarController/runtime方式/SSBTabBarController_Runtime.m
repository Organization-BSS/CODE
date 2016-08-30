//
//  SSBTabBarController_Runtime.m
//  MyUITabbarController
//
//  Created by bss on 16/8/23.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "SSBTabBarController_Runtime.h"
#import "ViewController.h"
#import "SSBTabBarExtension.h"

@interface SSBTabBarController_Runtime ()

@end

@implementation SSBTabBarController_Runtime

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self addChildControllers];
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

// 添加子控制器
- (void)addChildControllers {
    /*添加子控制器 */
    /** 精华 */
    [self setUpChildControllerWith:[[ViewController alloc]init] norImage:[UIImage imageNamed:@"tabBar_essence_icon"] selImage:[UIImage imageNamed:@"tabBar_essence_click_icon"] title:@"精华"];
    
    /** 新帖 */
    [self setUpChildControllerWith:[[ViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_new_icon"] selImage:[UIImage imageNamed:@"tabBar_new_click_icon"]title:@"新帖"];
    
    /** 关注 */
    [self setUpChildControllerWith:[[ViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] title:@"关注"];
    
    /** 我的 */
    [self setUpChildControllerWith:[[ViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_me_icon"] selImage:[UIImage imageNamed:@"tabBar_me_click_icon"] title:@"我的"];
    
    /** 配置中间按钮 */
    [self.tabBar  setUpTabBarCenterButton:^(UIButton *centerButton) {
        [centerButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        
        [centerButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        
        [centerButton addTarget:self action:@selector(chickCenterButton:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    /** 设置tabar工具条 */
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];

}

- (void)setUpChildControllerWith:(UIViewController *)childVc norImage:(UIImage *)norImage selImage:(UIImage *)selImage title:(NSString *)title {

    childVc.title = title;
    childVc.tabBarItem.image = norImage;
    childVc.tabBarItem.selectedImage = selImage;

    UINavigationController *nav = [[UINavigationController  alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}
- (void)chickCenterButton:(id)object {
    NSLog(@"center button pressed");
}
@end
