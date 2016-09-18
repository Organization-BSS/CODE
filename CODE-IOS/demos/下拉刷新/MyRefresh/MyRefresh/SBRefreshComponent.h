//
//  SBRefreshComponent.h
//  MyRefresh
//
//  Created by bss on 16/9/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  刷新控件的状态
 */
typedef NS_ENUM(NSInteger,SBRefreshStata) {
    
 SBRefreshStateIdle,       // 闲置状态
 SBRefreshStatePulling,    // 下拉状态
 SBRefreshStateRefreshing, // 刷新状态
 SBRefreshStateWillRefresh,// 即将刷新状态
 SBRefreshStateNoMoreData  // 加载完毕，没有更多数据了
};

/**
 *  刷新状态的回调
 */

/** 进入刷新状态的回调 */
typedef void (^SBRefreshComponentRefreshingBlock)();

/** 开始刷新后的回调 */
typedef void (^SBRefreshComponentBeginRefreshingBlock)();

/** 结束刷新后的回调 */
typedef void (^SBRefreshComponentEndRefreshingBlock)();


/**
 *  刷新组件的基类，一般用户作为公共方法和属性的抽象提取
 */
@interface SBRefreshComponent : UIView {
    __weak UIScrollView *_scrollView;
}
@property (nonatomic, copy) SBRefreshComponentRefreshingBlock refreshingBlock;


// 准备工作
- (void)prepare;
@end
