//
//  ViewController.m
//  DesignPatter_Prototype
//
//  Created by bss on 12/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "ViewController.h"
#import "Prototype.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeContactAdd];
    bu.frame = CGRectMake(100, 100, 200, 100);
    [bu addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bu];
    
    // Do any additional setup after loading the view, typically from a nib.
}

// test method
- (void)done:(id)object {
    [Prototype prototypeTest:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
