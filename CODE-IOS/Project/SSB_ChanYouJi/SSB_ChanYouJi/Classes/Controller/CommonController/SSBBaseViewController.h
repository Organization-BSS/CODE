//
//  SSBBaseViewController.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/8/31.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  对基类一些抽象方法的提取协议，面向协议编程，面向抽象编程
 */
@protocol SSBBaseControllerMethod

@required

/**
 *  设置控制器的标题，在子类中复写该方法，在方法内返回当前控制器的标题
 *
 *  @param viewController 当前控制器,暂时不需要填写
 *  @param str            标题，暂时不需要填写
 *
 *  @return 返回当前控制器的标题
 */
- (NSString *)viewController:(UIViewController *)viewController controllerTitile:(NSString *)str;
@end

/**
 *  形态、特点等有共性的controller的抽象类
 */
@interface SSBBaseViewController : UIViewController <SSBBaseControllerMethod>

@end
