//
//  CYJBaseView.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/21.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "CYJBaseView.h"

@implementation CYJBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)willMoveToSuperview:(UIView *)newSuperview {
    self.backgroundColor = [UIColor randomColor];

}

@end
