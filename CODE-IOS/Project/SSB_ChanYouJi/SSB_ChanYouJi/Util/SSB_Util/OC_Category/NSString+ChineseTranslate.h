//
//  NSString+ChineseTranslate.h
//  HangDuoDuo
//
//  Created by bss on 16/9/19.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChineseTranslate)

// 汉字转成拼音
+ (NSString *)transform:(NSString *)chinese;

// 汉字转换为拼音，没有空格
+ (NSString *)transformWithOutSpace:(NSString *)chinese;
@end
