//
//  RequestProperty.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/28.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "RequestProperty.h"

@implementation RequestProperty

- (void)setIsRefresh:(BOOL)isRefresh {
    _isRefresh = isRefresh;
    _isLoadMore = !isRefresh;
    _isOver = !isRefresh;
}

- (void)setIsLoadMore:(BOOL)isLoadMore {
    _isLoadMore = isLoadMore;
    _isRefresh = !isLoadMore;
}

@end
