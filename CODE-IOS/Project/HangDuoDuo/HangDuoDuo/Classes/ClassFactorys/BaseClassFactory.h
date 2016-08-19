//
//  BaseClassFactory.h
//  Hangduoduo
//
//  Created by bss on 16/7/20.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BaseClassFactory : NSObject

//  根据类名返回对应的类
+ (id)objectWithClassName:(NSString *)className;

@end
