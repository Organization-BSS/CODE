//
//  ViewController.m
//  XIB
//
//  Created by bss on 16/6/27.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh/MJRefresh.h"

static const CGFloat MJDuration = 2.0;


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    
    UITableView *table;
    NSMutableArray *titlesArray; // 显示cell标题等数组
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf updateData];
    }];
    table.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    // 马上进入刷新状态
    
    [table.mj_header beginRefreshing];
    
    table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    table.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:table];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark instance method
// 刷新
- (void)updateData {
    NSLog(@"refresh");
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [table reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [table.mj_header endRefreshing];
    });
    
}

//  下载更多
- (void)loadMoreData {
    NSLog(@"loadMoreData");
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [table reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [table.mj_footer endRefreshing];
    });
}

#pragma mark UITableViewDelegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark UITableViewDataSource method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"fwfw";
    return  cell;
}
@end
