//
//  SSBContainNavigationViewController.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/2.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSBContainNavigationViewController.h"

@interface SSBContainNavigationViewController ()

@end

@implementation SSBContainNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavigationBar];
    self.navigationItem.title = [self viewController:nil controllerTitile:nil];
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
// 配置导航栏背景
- (void)configureNavigationBar {
    
    UIImage *backgroundImageForDefaultMetrics = [UIImage imageNamed:@"NavigationBarShadow"];
    id navigationBarAppearance = self.navigationController.navigationBar;
    [navigationBarAppearance setBackgroundImage:backgroundImageForDefaultMetrics forBarMetrics:UIBarMetricsDefault];
    

    // 定义字体 大小 颜色
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // 设置返回按钮
    UIImage *backImage = [UIImage imageNamed:@"BackButton1"] ;
//    backImage = [UIImage  imageNamed:@"Menu"] ;

    
    self.navigationItem.backBarButtonItem  = [SSBBarButtonItem backBarButtonItemWhenContainedIn:[SSBNavigationController class] image:backImage];
 


   
}

- ( UIImage *)imageWithImageSimple:( UIImage *)image scaledToSize:( CGSize )newSize

{
    
    // Create a graphics image context
    
    UIGraphicsBeginImageContext (newSize);
    
    // Tell the old image to draw in this new context, with the desired
    
    // new size
    
    [image drawInRect : CGRectMake ( 0 , 0 ,newSize. width ,newSize. height )];
    
    // Get the new image from the context
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext ();
    
    // End the context
    
    UIGraphicsEndImageContext ();
    
    // Return the new image.
    
    return newImage;
    
}
@end
