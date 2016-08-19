//
//  Addition.h
//  UnitTest
//
//  Created by bss on 16/8/18.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Foundation;

@interface Addition : NSObject

@property (nonatomic, assign) NSInteger leftValue;
@property (nonatomic, assign) NSInteger rightValue;

- (NSInteger)addResult;
@end
