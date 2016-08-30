//
//  SSBTabBarExtension.m
//  MyUITabbarController
//
//  Created by bss on 16/8/23.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "SSBTabBarExtension.h"
#import <objc/runtime.h>

@implementation SSBTabBarExtension


@end

@implementation UITabBar (SSBTabbarExtension)
static NSString *AssociatedButtonKey = @"associationkey";

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(layoutSubviews));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzled_layoutSubviews));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button = objc_getAssociatedObject(self, &AssociatedButtonKey);
        if (!button) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            objc_setAssociatedObject(self, &AssociatedButtonKey, button, OBJC_ASSOCIATION_RETAIN);
        }
        [self addSubview:button];
    }
    return  self;
}

- (void)swizzled_layoutSubviews {
    [self swizzled_layoutSubviews];
    
    
    [self setValue:[NSValue valueWithCGRect:self.bounds] forKeyPath:@"_backgroundView.frame"];
    
    UIButton  *centerButton = objc_getAssociatedObject(self, &AssociatedButtonKey);
    
    centerButton.bounds = CGRectMake(0, 0, centerButton.currentBackgroundImage.size.width, centerButton.currentBackgroundImage.size.height);
    CGFloat buttonW = self.frame.size.width / (self.items.count + 1);
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    CGFloat buttonX = 0;
    int index = 0;
    
    centerButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    for (UIView *chidView in self.subviews) {
        if ([chidView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            buttonX = index *buttonW;
            index++;
            if (index == 2) {
                index++;
            }
            chidView.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        }
    }

}
- (void)setUpTabBarCenterButton:(void ( ^ _Nullable )(UIButton * _Nullable centerButton ))centerButtonBlock {
    centerButtonBlock(objc_getAssociatedObject(self, &AssociatedButtonKey));
}

@end
