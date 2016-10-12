//
//  DataCenter.m
//  SSCDataManager
//
//  Created by bss on 16/10/12.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "DataCenter.h"
static DataCenter *dataCenter;

@implementation DataCenter

+ (instancetype)sharedDataCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc]init];
        dataCenter.logString = @" ";
    });
    return dataCenter;
}
- (NSString *)limitNumber {
    if (_limitNumber == nil) {
        _limitNumber = @"1000";
    }
    return _limitNumber;
}
@end
