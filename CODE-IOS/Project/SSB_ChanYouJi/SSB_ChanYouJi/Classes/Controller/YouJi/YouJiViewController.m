//
//  YouJiViewController.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/8/31.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "YouJiViewController.h"
#import "ConstantValues.h"
#import "TripsFeaturedViewModel.h"
#import "SSBBarButtonItem.h"
#import "SSBSegementControll.h"
#import "SSBSettingViewController.h"
#import "YouJiScrollView.h"

@interface YouJiViewController ()
@property (nonatomic,strong) TripsFeaturedViewModel* featureViewModel;

@end

@implementation YouJiViewController

#pragma mark - lifecycle
- (void)viewWillAppear:(BOOL)animated {
}

- (void)viewDidAppear:(BOOL)animated {
//    self.tabBarController.tabBar.hidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addControlls];
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 返回标题
- (NSString *)viewController:(UIViewController *)viewController controllerTitile:(NSString *)str {
    
    return TITILE_NaivationBar_YouJi;
    
}

#pragma mark -
#pragma mark instance method
- (void)addControlls {
    self.view.backgroundColor = CYJCOLOR_BACKGROUND;
    [self addLeftAndRightBarItem];

    SSBSegementControll *segmentControll = [[SSBSegementControll alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 40) buttonTitiles:@[@"游记",@"专题"] selectedTitileColor:CYJCOLOR_SEGMENTWORDS buttonSelectedBlock:^(UIButton *button){
        NSLog(@"%@",button);
    } andSuperView:self.view];
    
   
    YouJiScrollView *scroolView = [[YouJiScrollView alloc]initWithFrame:CGRectMake(0, segmentControll.frame.origin.y+segmentControll.frame.size.height,kScreen_Width , kScreen_Height-NAVBAR_H-TABBAR_H-segmentControll.mj_h)];
    scroolView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scroolView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)addLeftAndRightBarItem {
    
    self.navigationItem.leftBarButtonItem = [SSBBarButtonItem leftBarButtonItemController:self image:[[UIImage imageNamed:@"SettingBarButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] action:@selector(settingButtonClicked:)];

    self.navigationItem.rightBarButtonItem = [SSBBarButtonItem rightBarButtonItemController:self image:[[UIImage imageNamed:@"NavBar_Search_Normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]action:@selector(searchButtonClicked:)];
}

#pragma mark - instance method 
- (void)settingButtonClicked:(UIBarButtonItem *)buttonItem {
    UIViewController *vc = SSBINITOBJECT(SSBSettingViewController);
    self.hidesBottomBarWhenPushed =YES;
    self.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed =NO;

}

- (void)searchButtonClicked:(UIBarButtonItem *)buttonItem {
}


@end
