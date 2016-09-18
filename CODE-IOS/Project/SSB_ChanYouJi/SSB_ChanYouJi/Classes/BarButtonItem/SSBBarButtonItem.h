//
//  SSBBarButtonItem.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/1.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  管理导航栏的左右item
 */
@interface SSBBarButtonItem : NSObject

/**
 *  使用图片定义返回按钮
 *
 *  @param ContainerClass 所在的navigationcontroller
 *  @param image          设置的图片
 *
 *  @return 返回 backbaritem
 */
+ (UIBarButtonItem * _Nonnull )backBarButtonItemWhenContainedIn:(nullable Class <UIAppearanceContainer>)ContainerClass image:(UIImage *_Nonnull)image;

/**
 *  使用图片定义导航栏的左侧按钮
 *
 *  @param controller 当前页面坐在的控制器
 *  @param image      左侧按钮图片
 *  @param selector   用户点击调用的处理事件
 *  @return 返回 leftbarbutton
 */
+ (UIBarButtonItem *_Nonnull)leftBarButtonItemController:(UIViewController *_Nonnull)controller image:(UIImage *_Nonnull)image action:(SEL _Nonnull)selector;

/**
 *  使用图片定义导航栏的右侧按钮
 *
 *  @param controller 当前页面坐在的控制器
 *  @param image      右侧按钮图片
 *  @param selector   用户点击调用的处理事件
 *  @return 返回 rightbarbutton
 */
+ (UIBarButtonItem *_Nonnull)rightBarButtonItemController:(UIViewController *_Nonnull)controller image:(UIImage *_Nonnull)image action:(SEL _Nonnull)selector;
@end
