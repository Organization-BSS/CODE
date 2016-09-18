//
//  SSBSegementControll.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/18.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBSegementControll : UIView

/**
 *  自定义segementcontroll的初始化方法
 *
 *  @param frame  设置位置与大小
 *  @param titiles 设置要显示的一排名称
 *  @param color   点击后文字的显示颜色
 *  @param block   用户点击按钮后的回调
 *
 *  @return 返回当前类的实例对象
 */
- (instancetype)initWithFrame:(CGRect)frame buttonTitiles:(NSArray *)titiles selectedTitileColor:(UIColor *)color buttonSelectedBlock:(ButtonClickBlock)block andSuperView:(UIView *)superView;

@end
