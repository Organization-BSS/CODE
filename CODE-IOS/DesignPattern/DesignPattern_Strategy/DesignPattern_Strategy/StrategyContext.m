//
//  StrategyContext.m
//  DesignPattern_Strategy
//
//  Created by bss on 16/8/1.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "StrategyContext.h"

@implementation StrategyContext


- (void)setStrategy:(id<IStrategy>)stra {
    strategy = stra;
}

- (void)operate {
    [strategy operate];
	
}
@end
