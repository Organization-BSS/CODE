//
//  YouJiScrollView.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/21.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "YouJiScrollView.h"
#import "YouJiView.h"
#import "SpecialTopicView.h"

@interface YouJiScrollView()

@property (nonatomic,strong) YouJiView *youJiView;
@property (nonatomic,strong) SpecialTopicView *specialTopicView;

@end
@implementation YouJiScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    self.pagingEnabled = YES;
    self.contentSize = CGSizeMake(self.mj_w*2, self.mj_h);
    self.bounces = NO;
    [self addControlls];
}

- (void)addControlls {
    
    _youJiView = [YouJiView new];
    _youJiView.frame = CGRectMake(0, 0, self.mj_w, self.mj_h);
    [self addSubview: _youJiView];
}

// lazyload
- (SpecialTopicView *)getSpecialTopicView {
    if (_specialTopicView == nil) {
        _specialTopicView = [SpecialTopicView new];
        _specialTopicView.frame = CGRectMake(_youJiView.mj_w, 0, self.mj_w, self.mj_h);
        [self addSubview:_specialTopicView];
    }
    return _specialTopicView;
}

@end
