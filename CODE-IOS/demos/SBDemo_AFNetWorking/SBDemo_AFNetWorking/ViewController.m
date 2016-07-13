//
//  ViewController.m
//  SBDemo_AFNetWorking
//
//  Created by bss on 16/7/12.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
    
    UITableView *table;
    NSMutableArray *contentsArray;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    
    // add data
    [self addDatas];
    
    table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    // test method
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark instance method

// 增添测试页面
- (void)addDatas {
    self.title = @"网络请求";
    contentsArray = [[NSMutableArray alloc]initWithObjects:@"Get",@"Post",@"UploadPicture",nil];
}

#pragma mark UITableViewDataSource method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contentsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [contentsArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 获取vc的字符串形式
    NSString *title = [contentsArray objectAtIndex:indexPath.row];
    // 创建类
    Class class = NSClassFromString([NSString stringWithFormat:@"%@ViewController",title]);
    UIViewController *vc = (UIViewController *)[class new];
    UIViewController * CONVC = ((UIViewController * (*)(id,SEL))objc_msgSend)(class,@selector(alloc));
   UIViewController * CONVC2 = ((UIViewController * (*)(id,SEL))objc_msgSend)(CONVC,NSSelectorFromString(@"init"));

    
    //((HYBMsgSend * (*)(id, SEL))objc_msgSend)((id)[HYBMsgSend class], @selector(alloc));
    // 放入导航栈
    [self.navigationController pushViewController:CONVC2 animated:YES];
    
}

@end
   