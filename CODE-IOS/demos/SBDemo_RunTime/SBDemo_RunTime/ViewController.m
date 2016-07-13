//
//  ViewController.m
//  SBDemo_RunTime
//
//  Created by bss on 16/7/11.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "ViewController.h"
#import <objc/objc-runtime.h>
#import "Person.h"
@class Person;

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
    [self testRunTime];
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

// 测试runtime的入口
- (void)testRunTime {
    
#pragma mark runtime base
    
    Class class_Person = [Person class];
    
    // 获取类的名称
    NSString *className = NSStringFromClass(class_Person);
   const char * name = class_getName(class_Person);
    NSString *nameString = [NSString stringWithUTF8String:name];

    Person *per = [[Person alloc]init];
    // 获取当前对象的类
    Class object = object_getClass(per);

    NSObject *ob = [[NSObject alloc]init];
    // 修改当前对象的所属类
    // Class cla = object_setClass(ob, object);// 系统会报错

    // 通过类的实例对象获取类的名称
    const char *clssName = object_getClassName(per);
    
    // 通过类的名称创建类的实例
    Class class_P = NSClassFromString(className);
    
#pragma mark --
#pragma mark 消息机制介绍 / Messaging
    //
//    ((HYBMsgSend * (*)(id, SEL))objc_msgSend)
//    ((id)[HYBMsgSend class], @sel
   Person * person = ((id (*)(id,SEL))objc_msgSend)(class_P,@selector(alloc));
    
}

@end