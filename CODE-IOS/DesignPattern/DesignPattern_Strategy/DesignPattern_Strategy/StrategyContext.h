//
//  StrategyContext.h
//  DesignPattern_Strategy
//
//  Created by bss on 16/8/1.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IStrategy.h"

@interface StrategyContext : NSObject {
    id<IStrategy> strategy;
}
- (void)setStrategy:(id<IStrategy>)stra;
- (void)operate;
@end
