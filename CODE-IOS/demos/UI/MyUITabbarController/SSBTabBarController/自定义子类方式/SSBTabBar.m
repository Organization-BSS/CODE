//
//  SSBTabBar.m
//  MyUITabbarController
//
//  Created by bss on 16/8/23.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "SSBTabBar.h"
#import "AppDelegate.h"

@implementation SSBTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// use lazy load to make sure unique plus button
- (UIButton *)plusButton {
    
    if (_plusButton == nil) {
        UIButton *bu = [UIButton buttonWithType:UIButtonTypeCustom];
        _plusButton = bu;
        [_plusButton setImage:[UIImage imageNamed:@"tabBar_publishx.png"] forState:UIControlStateNormal];
        // 3. 设置btn按钮的尺寸和图片的默认大小一样大
//        [_plusButton sizeToFit];
       _plusButton.frame = CGRectMake(0, -30, 80, 80);
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

#pragma mark - 调整子控件的位置和尺寸
// 调整子控件的位置和尺寸
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat butX = 0;  // x 是不确定的,可以初始化为0
    CGFloat butY = 0;  // y 就是0
    CGFloat butW = w / (self.items.count + 1); // 有几个UITabBarButton就有几个items模型
    CGFloat butH = h;
    
    int i = 0; // 定义角标,初始化为0
    // 调整系统自带的tabBar上面的按钮的位置
    for (UIView *tabBarButton in self.subviews) {
        // 判断是否是UITabBarButton
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView*vi in tabBarButton.subviews) {
                NSLog(@"%@",vi);
                if ([vi isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
                    NSString *titile = [vi valueForKey:@"text"];
                    NSLog(@"titile is:%@",titile);
                    if ([titile isEqualToString:@"我"]) {
                        AppDelegate *app = [[UIApplication sharedApplication]delegate];
                        app.bottomView = vi;
                    }
                }
            }
            
            // 因为中间需要预留一个位置,所以,当i到中间的是,就跳过
            if (i == 2) {
                i = 3;
            }
            butX = i * butW;
            tabBarButton.frame = CGRectMake(butX, butY, butW, butH);
            i++;
        }
    }
    
    // 设置中间按钮的位置
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5-10);

}

// 当用户点击突出tabbar的时候，解决方案
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *vi = [super hitTest:point withEvent:event];
    
    if ( vi == nil) {
        CGPoint tempoint = [_plusButton convertPoint:point fromView:self];
        if (CGRectContainsPoint(_plusButton.bounds, tempoint))
        {
            vi = _plusButton;
        }
    }
    return  vi;
}

@end
