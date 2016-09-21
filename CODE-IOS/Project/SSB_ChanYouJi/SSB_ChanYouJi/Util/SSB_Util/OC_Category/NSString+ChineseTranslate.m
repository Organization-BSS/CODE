//
//  NSString+ChineseTranslate.m
//  HangDuoDuo
//
//  Created by bss on 16/9/19.
//  Copyright © 2016年 Beijing Galaxy Hangduoduo Technology Co., Ltd. All rights reserved.
//

#import "NSString+ChineseTranslate.h"

@implementation NSString (ChineseTranslate)

+ (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    return [pinyin uppercaseString];
}

+ (NSString *)transformWithOutSpace:(NSString *)chinese {
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    NSArray *strs = [pinyin componentsSeparatedByString:@" "];
    
    NSString *pinYinWithOutSpace = [strs firstObject];
    for (int i = 1; i < strs.count; i++) {
        pinYinWithOutSpace = [NSString stringWithFormat:@"%@%@",pinYinWithOutSpace,[strs objectAtIndex:i]];
    }
    return pinYinWithOutSpace ;
}
@end
