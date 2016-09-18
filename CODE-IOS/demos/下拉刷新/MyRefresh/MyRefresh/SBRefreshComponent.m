//
//  SBRefreshComponent.m
//  MyRefresh
//
//  Created by bss on 16/9/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SBRefreshComponent.h"

@implementation SBRefreshComponent

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

- (void)prepare {
    
    NSLog(@"%s:%d",
          __func__, __LINE__);

}


- (void)willMoveToSuperview:(UIView *)newSuperview {
    NSLog(@"%s:%d",
          __func__, __LINE__);
}

- (void)layoutSubviews {
    NSLog(@"%s:%d",
          __func__, __LINE__);
}

@end
