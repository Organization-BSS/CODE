//
//  YouJiView.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/21.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "YouJiView.h"

@interface YouJiView()<UITableViewDelegate,UITableViewDataSource> {
    
    UITableView *table;
}
@property (nonatomic,strong)YouJiViewModel *youJiViewModel;
@end

@implementation YouJiView

- (void)didMoveToSuperview {
    
    self.youJiViewModel = [[YouJiViewModel alloc]init];
    [self.youJiViewModel refresh];
    [self addTabeView];
    self.youJiViewModel.showView = table;
}

- (void)addTabeView {
    
    table = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [_youJiViewModel loadMore];
    }];

    [self addSubview:table];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _youJiViewModel.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIndentifier = @"cellIndentifier";
    YouJiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"YouJiCell" owner:self options:nil] lastObject];
    }
    cell.model = _youJiViewModel.datas[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
