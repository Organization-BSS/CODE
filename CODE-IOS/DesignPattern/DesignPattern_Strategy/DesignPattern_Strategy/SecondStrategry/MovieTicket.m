//
//  MovieTicket.m
//  DesignPattern_Strategy
//
//  Created by bss on 16/8/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "MovieTicket.h"

@implementation MovieTicket 

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"init");
    }
    return self;
}
+ (void)load {
    NSLog(@"load");
}
- (double)getPrice {
    return [_discount caculate:_price];
}

@end
