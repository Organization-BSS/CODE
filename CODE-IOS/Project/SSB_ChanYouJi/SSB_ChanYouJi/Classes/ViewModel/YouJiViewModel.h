//
//  YouJiViewModel.h
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/22.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSBBaseViewModel.h"
#import "YouJiModel.h"
#import "RequestActionProtocol.h"

@interface YouJiViewModel : SSBBaseViewModel <RequestActionProtocol>

@property (nonatomic,strong)YouJiModel *youJiModel;
@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,weak)UITableView *showView;
- (void)requestData;
@end
