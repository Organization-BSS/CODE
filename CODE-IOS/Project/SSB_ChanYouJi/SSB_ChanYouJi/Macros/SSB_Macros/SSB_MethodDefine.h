//
//  SSB_MethodDefine.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/8/29.
//  Copyright © 2016年 BSS. All rights reserved.
//

#ifndef SSB_MethodDefine_h
#define SSB_MethodDefine_h

// 获取类名
#define CLASS_STRING(X) NSStringFromClass([X class])

// 创建UIImae
#define SSBIMAGEWITHNAME(X) [UIImage imageNamed:X]

// 对象初始化
#define SSBINITOBJECT(X) [[X alloc]init]

#endif /* SSB_MethodDefine_h */
