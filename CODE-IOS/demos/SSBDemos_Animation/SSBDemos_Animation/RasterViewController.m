//
//  RasterViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/6/30.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "RasterViewController.h"

@interface RasterViewController ()

@end

@implementation RasterViewController

- (UIButton *)customButton
{
    //create button
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    
    //add label
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"Hello World";
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return button;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //create opaque button
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(100, 150);
    [self.containerView addSubview:button1];
    
    //create translucent button
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(270, 150);
    button2.alpha = 0.4;
    button2.layer.shouldRasterize = YES;
    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;

    [self.containerView addSubview:button2];
    
    //enable rasterization for the translucent button
}
@end
