//
//  Discount.h
//  DesignPattern_Strategy
//
//  Created by bss on 16/8/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Discount <NSObject>
@required
- (double)caculate:(double)price;
@end
