//
//  SSBSegementControll.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/18.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSBSegementControll.h"

const NSInteger baseTagNumber = 100;
@interface SSBSegementControll()

//底部视图
@property (nonatomic, strong) UIView *underTitileView;

//要显示的标题
@property (nonatomic, strong) NSArray *titiles;

//选择后的文字颜色
@property (nonatomic, strong) UIColor *selectedTitileColor;

//选择的下标
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic,strong) UIButton * currentButton;

//用户点击所产生的触发事件
@property (nonnull,copy)ButtonClickBlock clickBlock;
@end

@implementation SSBSegementControll

- (instancetype)initWithFrame:(CGRect)frame buttonTitiles:(NSArray *)titiles selectedTitileColor:(UIColor *)color buttonSelectedBlock:(ButtonClickBlock)block andSuperView:(UIView *)superView {
    self = [super initWithFrame:frame];
    if (self) {
        self.titiles = titiles;
        self.selectedTitileColor = color;
        self.clickBlock = block;
        [self setControlls];
    }
    [superView addSubview:self];
    return  self;
}

// 设置控件
- (void)setControlls {
    
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat leftMargin = 6;
    CGFloat topMargin = 4;
    // 设置子视图高度
    CGFloat height = self.bounds.size.height - topMargin*2;
    // 设置子视图宽度
    CGFloat width = self.bounds.size.width - leftMargin*2;
    CGFloat perButtonWidth = width/_titiles.count;
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(leftMargin, topMargin, width, height)];
    vi.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
    vi.layer.cornerRadius = 5;
    vi.layer.borderWidth = 0.2;
    vi.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [self addSubview:vi];
    
    _underTitileView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, perButtonWidth, height)];
    _underTitileView.layer.cornerRadius = vi.layer.cornerRadius;
    _underTitileView.backgroundColor = [UIColor whiteColor];
    _underTitileView.layer.borderWidth = 0.2;
    _underTitileView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [vi addSubview:_underTitileView];

    // 布局按钮
    for (int i = 0; i < _titiles.count; i++) {
        
        UIButton *bu = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect buttonFrame = CGRectMake(i*perButtonWidth, 0, perButtonWidth, height);
        bu.frame = buttonFrame;
        bu.tag = i + baseTagNumber;
        bu.layer.cornerRadius = self.layer.cornerRadius;
        [bu setTitle:_titiles[i] forState:UIControlStateNormal];
        [bu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bu setTitleColor:_selectedTitileColor forState:UIControlStateSelected];
        [bu addTarget:self action:@selector(buttonSeleted:) forControlEvents:UIControlEventTouchUpInside];
        bu.titleLabel.font = [UIFont systemFontOfSize:14];
        bu.backgroundColor = [UIColor clearColor];
        [vi addSubview:bu];
    }
    _currentButton = (UIButton * )[vi viewWithTag:baseTagNumber];
    _currentButton.selected = YES;
}

// 用户点击按钮事件
- (void)buttonSeleted:(UIButton *)button {
   // NSLog(@"%@",button);
    [self animateUnderView:button];
    __weak typeof(button) weakself = button;
    self.clickBlock(weakself);
}

// button底部的view根据用户的点击所产生的动画
- (void)animateUnderView:(UIButton *)button {
    if (_currentButton == button) {
        return;
    }
    _currentButton.selected = !_currentButton.selected;
    button.selected = !button.selected;
    _currentButton = button;
    CGRect buttonRect = button.frame;
    [UIView animateWithDuration:0.2 animations:^{
        _underTitileView.frame = buttonRect;
    }];
    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    UIButton *button = [self viewWithTag:selectedIndex];
    [self animateUnderView:button];
}
@end
