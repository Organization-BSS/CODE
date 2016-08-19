//
//  RootViewController.m
//  Demo_UI_NavigtionController
//
//  Created by bss on 16/8/3.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    [self configureNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushVC:(id)sender {

    SecondViewController *SVC = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:SVC animated:YES];
//    self.navigationItem.backBarButtonItem *
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)configureNavigation {
    
    self.navigationItem.title = @"nihao ";
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    
//    self.navigationController.navigationBar.tintColor = [UIColor redColor];
//    
//    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    navigationBar.translucent = YES;
//    navigationBar.hidden = YES;
    UINavigationItem *centerItem = [[UINavigationItem alloc]initWithTitle:@"f232"];
    UINavigationItem *item2 = [[UINavigationItem alloc]initWithTitle:nil];
    UINavigationItem *item3 = [[UINavigationItem alloc]initWithTitle:@"helog"];


//    [navigationBar pushNavigationItem:centerItem animated:YES];
    UINavigationBar *bar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen]bounds].size.width, 44)];
    bar.barStyle = UIBarStyleBlack;
    [bar pushNavigationItem:centerItem animated:YES];
    [bar pushNavigationItem:item2 animated:YES];
    [bar pushNavigationItem:item3 animated:YES];
    [self.view addSubview:bar];
    
    bar.tintColor = [UIColor whiteColor];
    NSDictionary *dict = [[NSDictionary alloc]initWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:50],NSFontAttributeName, nil];
    bar.titleTextAttributes = dict;
    [bar setTitleVerticalPositionAdjustment:35 forBarMetrics:UIBarMetricsDefault];
    [bar setBackIndicatorImage:[UIImage imageNamed:@"back.png"]];
    [bar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back.png"]];
    

    
}


@end
