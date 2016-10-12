//
//  DataCenter.h
//  SSCDataManager
//
//  Created by bss on 16/10/12.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedDataCenter;

@property (nonatomic,strong) NSString *logString;
@property (nonatomic,assign) NSInteger totalNubmers;
@property (nonatomic,strong) NSNumber *number;
@property (nonatomic,strong) NSString *limitNumber;



@end
