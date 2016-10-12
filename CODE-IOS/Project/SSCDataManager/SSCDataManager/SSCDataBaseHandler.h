//
//  SSCDataBaseHandler.h
//  SSCDataManager
//
//  Created by bss on 16/10/10.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseProtocol.h"
#import "fmdb/FMDB.h"
@interface SSCDataBaseHandler : NSObject <DataBaseProtocol>
{
    NSInteger counter;
}

- (void)handleData;
- (void)searDataFromDataBase:(NSInteger)numbers;
- (instancetype)init;
- (void)reSaveData ;

@end
