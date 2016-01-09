//
//  ViewController.m
//  Study_CoreData_2016_01_09
//
//  Created by bss on 1/9/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testMyCoreData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testMyCoreData {
    
    // 1.大家上下文环境
    
    // 从应用程序加载数据模型
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
     // 传入对象模型，初始化NSPersistentStoreCoordinator
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    // 构建SQLite数据库文件的路径
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"coredata.sqlite"]];
    
    // 添加持久化存储库，这里使用SQLite作为存储库
    NSError *error  = nil;
    NSPersistentStore *store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    if (store == nil) {
        NSLog(@"添加持久化存储库失败");
         [NSException raise:@"添加数据库错误" format:@"%@", [error localizedDescription]];  
    }
    
    // 初始化上下文，设置persistentStoreCoordinator属性
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
    context.persistentStoreCoordinator = coordinator;
    
    
}
@end
