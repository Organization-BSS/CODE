//
//  SSBView.m
//  Demo_UI_UIView
//
//  Created by bss on 16/8/18.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "SSBView.h"
@import Foundation;

@implementation SSBView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)test {
    NSLog(@"%@",self.window);

	
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    NSLog(@"%lf,%lf",point.x,point.y);
    UIEvent
}


@end