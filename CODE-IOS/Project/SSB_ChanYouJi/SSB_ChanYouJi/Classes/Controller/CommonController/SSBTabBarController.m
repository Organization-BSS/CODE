//
//  SSBTabBarController.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/8/31.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSBTabBarController.h"

@interface SSBTabBarController ()

@end

@implementation SSBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addControllers];
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

// 添加底部控制器
- (void)addControllers {
    
    NSArray *vcs = @[SSBINITOBJECT(YouJiViewController),SSBINITOBJECT(TravelStrategyViewController),SSBINITOBJECT(ToolBoxViewController),SSBINITOBJECT(MineViewController),SSBINITOBJECT(OffLineViewController)];
    
    NSArray *tabBarTitles = @[TITILE_YouJi,TITILE_TravelStrategy,TITILE_ToolsBox,TITILE_My,TITILE_OffLine];
    
    NSArray *tabBarImages = @[@"TabBarIconFeatured",@"TabBarIconDestination",@"TabBarIconToolbox",@"TabBarIconMy",@"TabBarIconOffline"];
    
    for (UIViewController *vc in vcs) {
        NSInteger index = [vcs indexOfObject:vc];
        NSString *titile = [tabBarTitles objectAtIndex:index];
        NSString *selectedImageName = [tabBarImages objectAtIndex:index];
        NSString *normalImageName = [NSString stringWithFormat:@"%@Normal",selectedImageName];
        
        [self addChildViewController:vc titile:titile image:SSBIMAGEWITHNAME(normalImageName) selectedImage:SSBIMAGEWITHNAME(selectedImageName)];
    }
}

// 添加子控制器
- (void)addChildViewController:(UIViewController *)childController titile:(NSString *)titile image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    
    UIImage *selImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:titile image:image selectedImage:selImage];
    childController.tabBarItem = item;
    [self addChildViewController:childController];
}
@end
