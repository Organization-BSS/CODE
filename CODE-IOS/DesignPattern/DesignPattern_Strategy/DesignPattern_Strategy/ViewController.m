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

#import "Discount.h"
#import "ChildDiscount.h"
#import "StudentDiscount.h"
#import "MovieTicket.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test2];
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

/**
 *  使用电影票的案例测试策略模式
 */
- (void)test2 {
    MovieTicket *ticket = [[MovieTicket alloc]init];
    ticket.price = 80; // ticket price
    
    id<Discount> discount = nil; // 初始化打折策略类

    // condition one :now it's a child's ticket
    discount = [[ChildDiscount alloc]init];
    
    // use strategy
    ticket.discount = discount;
    NSLog(@"%lf",[ticket getPrice]);

}
@end
