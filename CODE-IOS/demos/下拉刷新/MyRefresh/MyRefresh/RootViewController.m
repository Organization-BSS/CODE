//
//  RootViewController.m
//  MyRefresh
//
//  Created by bss on 16/9/7.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController () <UITableViewDelegate,UITableViewDataSource> {
    UIView *headerView;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)addTableView {
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    CGRect rect = [[UIScreen mainScreen]bounds];
    UITableView *table = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    table.delegate = self;
    table.dataSource = self;
    table.contentInset = inset;
    
    [self.view addSubview:table];
    
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(00, -60, rect.size.width, 60)];
    headerView.backgroundColor= [UIColor clearColor];
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(125, 15, 140, 25)];
    la.text = @"下拉刷新";
    [headerView addSubview:la];
    
    [table insertSubview:headerView atIndex:0];
    

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"gwe"];
    cell.textLabel.text = @"io";
    return  cell;
}

@end
