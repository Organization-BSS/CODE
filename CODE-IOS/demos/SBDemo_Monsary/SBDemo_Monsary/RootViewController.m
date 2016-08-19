//
//  RootViewController.m
//  SBDemo_Monsary
//
//  Created by bss on 16/7/27.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "Masonry/Masonry.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView *superView = self.view;
    UIEdgeInsets padding = UIEdgeInsetsMake(110, 110, 110, 110);
    UIEdgeInsets padding2 = UIEdgeInsetsMake(10, 10, 10, 10);

    UIView *blueView = UIView.new;
    blueView.backgroundColor = [UIColor blueColor];
    [superView addSubview:blueView];
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = [UIColor greenColor];
    [superView addSubview:greenView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).with.offset(padding.top);
        make.left.equalTo(superView.mas_left).with.offset(padding.left);
        make.right.equalTo(superView.mas_right).with.offset(-padding.right);
        make.bottom.equalTo(superView.mas_bottom).with.offset(-padding.bottom);
        
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blueView.mas_bottom).with.offset(padding2.top);
        make.left.and.right.equalTo(blueView);
        make.bottom.equalTo(superView.mas_bottom).with.offset(-padding2.bottom);
    }];
    
    
#pragma mark 居中
    UIView *yellowView = UIView.new;
    yellowView.backgroundColor = [UIColor yellowColor];
    [superView addSubview:yellowView];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superView);
//        make.size.equalTo(greenView);
        make.size.mas_equalTo(CGSizeMake(300, 300));
        
    }];
    
#pragma mark 排列
    
    UIView *grayView = UIView.new;
    greenView.backgroundColor = [UIColor grayColor];
    [superView addSubview:grayView];
    
    UIView *orangeView = UIView.new;
    greenView.backgroundColor = [UIColor orangeColor];
    [superView addSubview:orangeView];
    
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

@end
