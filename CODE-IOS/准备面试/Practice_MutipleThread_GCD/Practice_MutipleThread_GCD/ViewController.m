//
//  ViewController.m
//  Practice_MutipleThread_GCD
//
//  Created by bss on 5/30/16.
//  Copyright (c) 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"
#import "MyGCD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyGCD  *gcd = [[MyGCD alloc]init];
    [gcd test_GCD];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
