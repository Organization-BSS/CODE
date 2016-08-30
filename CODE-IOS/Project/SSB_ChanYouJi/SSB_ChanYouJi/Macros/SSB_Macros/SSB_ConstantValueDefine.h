//
//  SSB_ConstantValueDefine.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/8/29.
//  Copyright © 2016年 BSS. All rights reserved.
//

#ifndef SSB_ConstantValueDefine_h
#define SSB_ConstantValueDefine_h

static float const STATUS_H =           20.0f;
static float const NAVBAR_H =           64.0f;
static float const NOTSTATUS_NAVBAR_H = 44.0f;
static float const TABBAR_H =           49.0f;

#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height


#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#endif /* SSB_ConstantValueDefine_h */
