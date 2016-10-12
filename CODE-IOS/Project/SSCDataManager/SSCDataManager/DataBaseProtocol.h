//
//  DataBaseProtocol.h
//  SSCDataManager
//
//  Created by bss on 16/10/10.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 面向协议编程
 **/

@protocol DataBaseProtocol <NSObject>

// 插入数据
- (void)insertObject:(id)object;
// 获取数据
- (id)getObjectWithSql:(NSString *)sqlString;
// 修改数据
- (void)modifyObjectWithSql:(NSString *)sqlString;
// 删除数据
- (void)deleteObjectWithSql:(NSString *)sqlString;


@end

