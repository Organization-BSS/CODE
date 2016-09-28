//
//  RequestActionProtocol.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/28.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestActionProtocol <NSObject>

/**
 * 刷新操作接口
 */
- (void)refresh;

/**
 * 加载更多接口
 */
- (void)loadMore;
@end
