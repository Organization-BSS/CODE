//
//  SSBBaseViewController.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/8/31.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSBBaseViewController.h"

@interface SSBBaseViewController ()

@end

@implementation SSBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.title = [self viewController:self controllerTitile:nil];
    // Do any additional setup after loading the view.
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
- (NSString *)viewController:(UIViewController *)viewController controllerTitile:(NSString *)str {
    return nil;
}
@end
