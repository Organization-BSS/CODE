//
//  SSBBarButtonItem.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/1.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSBBarButtonItem.h"

@implementation SSBBarButtonItem

// 返回导航栏返回按钮
+ (UIBarButtonItem *_Nonnull)backBarButtonItemWhenContainedIn:(nullable Class <UIAppearanceContainer>)ContainerClass image:(UIImage *_Nonnull)image {
    
    UIImage *backButtonBackgroundImage = image;
    backButtonBackgroundImage = [backButtonBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonBackgroundImage.size.width-1, 0, 0)];
    id appearance = [UIBarButtonItem appearanceWhenContainedIn:ContainerClass, nil];
    [appearance setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:NULL];

    return backBarButton;
}

// 返回导航栏左侧按钮
+ (UIBarButtonItem *_Nonnull)leftBarButtonItemController:(UIViewController *_Nonnull)controller image:(UIImage *_Nonnull)image action:(SEL _Nonnull)selector {
    
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:controller action:selector];
    
    return  leftButtonItem;
}

// 返回导航栏右侧按钮
+ (UIBarButtonItem *_Nonnull)rightBarButtonItemController:(UIViewController *_Nonnull)controller image:(UIImage *_Nonnull)image action:(SEL _Nonnull)selector {
    
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:controller action:selector];
    
    return  rightButtonItem;
}
@end
