//
//  RootViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/6/30.
//  Copyright © 2016年 bss. All rights reserved.
//
#import "RootViewController.h"
#import <objc/runtime.h>

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *table;
    NSMutableArray *contentsArray;
}

@end

@implementation RootViewController


/*
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
 // 添加测试的view
 UIView *view = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
 view.backgroundColor = [UIColor grayColor];
 [self.view addSubview:view];
 
 // 添加layer
 CALayer *layer = [CALayer layer];
 layer.frame = CGRectMake(0, 0, 100, 100);
 layer.backgroundColor = [[UIColor clearColor]CGColor];
 [view.layer addSublayer:layer];
 
 // 设置layer contents属性
 UIImage *image = [UIImage imageNamed:@"girl.png"];
 layer.contents = (__bridge id)image.CGImage;
 
 // 设置layer contentsGravity
 
 // layer.contentsGravity = kCAGravityResizeAspect;
 layer.contentsGravity = kCAGravityCenter;
 
 //set the contentsScale to match image
 layer.contentsScale = image.scale;
 
 // 设置layer masksToBounds
 layer.masksToBounds = YES;
 
 // anchor(锚点)：锚点是描绘图像选装的依据点。
 
 }
 */

- (void)viewDidLoad {
    
    [self addDatas];
    table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark instance method

// 增添测试页面
- (void)addDatas {
    self.title = @"Animations";
    contentsArray = [[NSMutableArray alloc]initWithObjects:@"Shadow",@"Mask",@"Raster",@"CGAffineTransform",@"ThreeDTransform",@"CAShaperLayer",@"CATextLayer",@"CATransformLayer",@"CAGradientLayer",@"Transaction",@"PropertyAnimation",@"Transition",@"Buffer",@"CustomBuffer",nil];
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
    NSString *animationTitle = [contentsArray objectAtIndex:indexPath.row];
    // 创建类
   Class class = NSClassFromString([NSString stringWithFormat:@"%@ViewController",animationTitle]);
    UIViewController *vc = (UIViewController *)[class new];
    
    // 放入导航栈
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
@end
