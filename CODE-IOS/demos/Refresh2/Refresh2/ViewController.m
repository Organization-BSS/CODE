//
//  ViewController.m
//  Refresh2
//
//  Created by bss on 6/26/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "ViewController.h"
#import "Vendor/MJRefresh/MJRefresh.h"
static const CGFloat MJDuration = 2.0;


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *table;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    table = [[UITableView alloc]initWithFrame:self.view.bounds];
    table.delegate = self;
    table.dataSource = self;
    __unsafe_unretained __typeof(self) weakSelf = self;

    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
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

- (void)loadNewData {
    NSLog(@"loadNewData");

    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [table reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [table.mj_header endRefreshing];
    });
    
}

- (void)loadMoreData {
    NSLog(@"loadMoreData");
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [table reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [table.mj_footer endRefreshing];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.backgroundColor = [UIColor yellowColor];
    
    cell.textLabel.text = @"3r3";
    return cell;
}

@end
