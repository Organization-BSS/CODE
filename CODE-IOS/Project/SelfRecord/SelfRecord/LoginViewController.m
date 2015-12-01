//
//  LoginViewController.m
//  SelfRecord
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "LoginViewController.h"
#import "PassWord.h"
#import "HomeViewController.h"


@interface LoginViewController () {
    int times;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    times = 0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeSure:(id)sender {
    
    NSString * pa = [[PassWord sharedPassWord]password];
    if([self.PassWordTextFiled.text isEqualToString:pa]) {
        if ([[PassWord sharedPassWord] number] == 2) {
            HomeViewController *homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
            [self presentViewController:homeVC animated:YES completion:nil];
        }
        else {
            LoginViewController *loginVC = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            [self presentViewController:loginVC animated:YES completion:nil];
        }
    }
    else {
        exit(0);
        
    }
 
//    HomeViewController *homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
//    [self presentViewController:homeVC animated:YES completion:nil];
//    
}
@end
