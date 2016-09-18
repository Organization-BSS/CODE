//
//  ViewController.m
//  MyRefresh
//
//  Created by bss on 16/9/6.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate> {
    
    UIScrollView *scrollView;
    UIView *headerView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addViews {
    UIScrollView *scrolll = [[UIScrollView alloc]initWithFrame:CGRectMake(30, 140, 300, 400)];
    scrolll.backgroundColor = [UIColor yellowColor];
    scrollView = scrolll;
    scrolll.delegate = self;
    scrolll.contentSize = CGSizeMake(300,401);
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(00, -100, 300, 100)];
    headerView.backgroundColor= [UIColor blackColor];
    
    [scrolll insertSubview:headerView atIndex:0];
    //[scrolll addSubview:headerView];
    
    
    [self.view addSubview:scrolll];
}

- (void)scrollViewDidScroll:(UIScrollView *)scroll {
    NSLog(@"%@",[NSValue valueWithCGPoint:scroll.contentOffset]);
    NSLog(@"%@",[NSValue valueWithUIEdgeInsets:scroll.contentInset]);
    
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
}
@end
