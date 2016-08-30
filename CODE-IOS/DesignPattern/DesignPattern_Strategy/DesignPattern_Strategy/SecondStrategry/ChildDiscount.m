//
//  ChildDiscount.m
//  DesignPattern_Strategy
//
//  Created by bss on 16/8/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "ChildDiscount.h"

@implementation ChildDiscount

- (double)caculate:(double)price {
    return price*0.8;
}
@end
