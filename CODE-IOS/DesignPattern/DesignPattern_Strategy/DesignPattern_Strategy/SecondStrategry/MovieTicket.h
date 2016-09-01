//
//  MovieTicket.h
//  DesignPattern_Strategy
//
//  Created by bss on 16/8/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Discount.h"

@interface MovieTicket : NSObject

@property (nonatomic, assign) double price;
@property (nonatomic, assign) id<Discount> discount;
- (double)getPrice;
- (instancetype)init;
@end