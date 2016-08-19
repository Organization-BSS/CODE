//
//  ViewController.m
//  DesignPattern_Strategy
//
//  Created by bss on 16/8/1.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "IStrategy.h"
#import "Strategy_add.h"
#import "Strategy_sub.h"
#import "StrategyContext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    id <IStrategy> strategy = nil;
    
    int value = 0;
    if (value) {
        strategy = [[Strategy_sub alloc]init];
    } else {
        strategy = [[Strategy_add alloc]init];
    }
    
    StrategyContext *context = [[StrategyContext alloc]init];
    [context setStrategy:strategy];
    [context operate];
    
    
    
    
}
@end
