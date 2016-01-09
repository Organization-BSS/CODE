//
//  ViewController.m
//  Study_CoreData-01-2015_12_28
//
//  Created by bss on 12/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testCoreData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 学习网址:
// http://www.cppblog.com/ipzyh/articles/CoreData.html
// http://blog.csdn.net/q199109106q/article/details/8563438/
// http://blog.csdn.net/rhljiayou/article/details/18037729/
// 测试coredata

- (void)testCoreData {
    
#pragma mark 搭建上下文环境
    // 从应用程序包中加载模型文件
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    // 传入模型对象，初始化NSPersistentStoreCoordinator
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model] ;
    
    // 构建SQLite数据库文件的路径
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",docs);
    NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"person.sqlite"]];
    
    // 添加持久化存储库，这里使用SQLite作为存储库
    NSError *error = nil;
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    if (store == nil) { // 直接抛异常
        [NSException raise:@"添加数据库错误" format:@"%@", [error localizedDescription]];
    }
    // 初始化上下文，设置persistentStoreCoordinator属性
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = psc;
    // 用完之后，记得要[context release];
    
#pragma mark -- 添加数据
    
    // 传入上下文，创建一个Person实体对象
    NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    // 设置Person的简单属性
    [person setValue:@"MJ" forKey:@"name"];
    [person setValue:[NSNumber numberWithInt:27] forKey:@"age"];
    // 传入上下文，创建一个Card实体对象
    NSManagedObject *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [card setValue:@"4414241933432" forKey:@"number"];
    // 设置Person和Card之间的关联关系
    [person setValue:card forKey:@"card"];
    // 利用上下文对象，将数据同步到持久化存储库
    NSError *error2 = nil;
    BOOL success = [context save:&error2];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@", [error localizedDescription]];
    }
    // 如果是想做更新操作：只要在更改了实体对象的属性后调用[context save:&error]，就能将更改的数据同步到数据库
    
#pragma mark 查询操作
    // 初始化一个查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init] ;
    // 设置要查询的实体
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    // 设置排序（按照age降序）
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@", @"*Itcast-1*"];
    request.predicate = predicate;
    // 执行请求
    NSError *error3 = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error3];
    if (error3) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    // 遍历数据
    for (NSManagedObject *obj in objs) {
        NSLog(@"name=%@", [obj valueForKey:@"name"]);
    }
    
    // 传入需要删除的实体对象
    [context deleteObject:managedObject];
    // 将结果同步到数据库
    NSError *error = nil;
    [context save:&error];
    if (error) {
        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
    }
    
}

@end
