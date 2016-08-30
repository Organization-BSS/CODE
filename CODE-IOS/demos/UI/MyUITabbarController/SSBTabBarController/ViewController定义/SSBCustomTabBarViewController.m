//
//  SSBCustomTabBarViewController.m
//  MyUITabbarController
//
//  Created by bss on 16/8/30.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "SSBCustomTabBarViewController.h"
#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
@interface SSBCustomTabBarViewController () {
    NSInteger selectedIndex;
}

@property (weak, nonatomic) IBOutlet UIView *TabBar;
@end

@implementation SSBCustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
    [self addControllers];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addControllers {
    UIViewController *vc1 = [[ViewController1 alloc]init];
    UIViewController *vc2 = [[ViewController2 alloc]init];
    
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    nav1.view.backgroundColor = [UIColor redColor];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    _viewControllers = @[nav1,nav2];
    
    
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    UIViewController *v1 = [self viewControllerByIndex:0];
    NSLog(@"%@",v1);
    self.view.bounds = screenBounds;
    [self.view addSubview:v1.view];
    NSLog(@"%@",v1.view);
    NSLog(@"%@",self.view);

    selectedIndex = 0;
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];

}

- (UIViewController *)viewControllerByIndex:(NSInteger)number {
    UIViewController *nav = [_viewControllers objectAtIndex:number];
    return nav;
}
- (IBAction)First:(id)sender {
     UIViewController *oldVC = [self viewControllerByIndex: selectedIndex];
    [oldVC.view removeFromSuperview];
    if (selectedIndex==_viewControllers.count-1) {
        selectedIndex = 0;
    } else
        selectedIndex++;
    UIViewController *vc = [self viewControllerByIndex: selectedIndex];
    [self.view addSubview:vc.view];
    
    NSLog(@"%@",vc.view);
    NSLog(@"%@",self.view);

    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
}

@end
