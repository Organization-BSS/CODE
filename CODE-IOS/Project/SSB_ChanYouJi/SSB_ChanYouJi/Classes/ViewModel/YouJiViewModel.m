//
//  YouJiViewModel.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/22.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "YouJiViewModel.h"
#import "RequestProperty.h"

@interface YouJiViewModel () {
    BOOL isRefresh;
}
@property (nonatomic,strong)SBURLSessionTask *requst;
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong)RequestProperty *requestPropery;
@end

@implementation YouJiViewModel


// 网络数据请求
- (void)requestData {
    
    self.requst = [SBHttpRequest.getSharedInstance getWithURLString:[CYJURL_TRIPS_Featured stringByAppendingString:[NSString stringWithFormat:@"?page=%ld",(long)self.page]] parameters:nil success:^(id success){
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:success options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",array);
        
        // 判断时候为下拉刷新操作
        if (self.requestPropery.isRefresh) {
            [self.datas removeAllObjects];
        }

        for (NSObject  *object in array) {
            YouJiModel *youJiModel = [YouJiModel yy_modelWithJSON:object];
            
            UIImageView *imageView = [[UIImageView alloc]init];
            [imageView sd_setImageWithURL:[NSURL URLWithString:youJiModel.front_cover_photo_url] placeholderImage:nil];
            [self.datas addObject:youJiModel];
        }
        [self.showView reloadData];
        [self.showView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

// lazy load RequestProperty Instance
- (RequestProperty *)requestPropery {
    if (_requestPropery==nil) {
        _requestPropery = [[RequestProperty alloc]init];
        _requestPropery.isRefresh = YES;
        _requestPropery.isLoadMore = NO;
        _requestPropery.isOver = NO;
    }
    return _requestPropery;
}

// 刷新
- (void)refresh {
    self.requestPropery.isRefresh = YES;
    self.page = 1;
    [self requestData];
}

// 加载更多
- (void)loadMore {
    self.requestPropery.isLoadMore = YES;
    self.page += 1;
    [self requestData];
}

// lazy load datas
- (NSMutableArray *)datas {
    if (_datas==nil) {
        _datas = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _datas;
}

@end
