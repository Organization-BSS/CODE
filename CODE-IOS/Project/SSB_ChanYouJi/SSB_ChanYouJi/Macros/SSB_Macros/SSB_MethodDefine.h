//
//  SSB_MethodDefine.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/8/29.
//  Copyright © 2016年 BSS. All rights reserved.
//

@class UIButton;

#ifndef SSB_MethodDefine_h
#define SSB_MethodDefine_h

// 获取类名
#define CLASS_STRING(X) NSStringFromClass([X class])

// 创建UIImae
#define SSBIMAGEWITHNAME(X) [UIImage imageNamed:X]

// 对象初始化
#define SSBINITOBJECT(X) [[X alloc]init]






#pragma mark -
#pragma mark BLOCKS DEFINE

// 用户点击button所触发的回调方法
typedef void(^ButtonClickBlock)(UIButton *button);


#endif /* SSB_MethodDefine_h */
