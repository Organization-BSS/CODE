//
//  SSBTabBarExtension.h
//  MyUITabbarController
//
//  Created by bss on 16/8/23.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBTabBarExtension : UIView

@end

@interface UITabBar (SSBTabbar_Extension)

// 设置中间按钮
- (void)setUpTabBarCenterButton:(void ( ^ _Nullable )(UIButton * _Nullable centerButton ))centerButtonBlock;
@end
