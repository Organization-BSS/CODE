//
//  ViewController.m
//  Practice_LLDBDebug
//
//  Created by bss on 6/5/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = [NSString stringWithFormat:@"hello word"];
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
