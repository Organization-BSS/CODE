//
//  SSCDataBaseHandler.m
//  SSCDataManager
//
//  Created by bss on 16/10/10.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSCDataBaseHandler.h"

#define CQSSCURL @"http://www.cp66607.com/api/cqssc?act=lishikaijianghaoma&limit="

#define XJSSCURL @"http://www.cp66607.com/api/xjssc?act=index&limit=26500"

@interface SSCDataBaseHandler()

@property (nonatomic,strong)NSMutableArray *columNames;
@property (nonatomic,strong)FMDatabase *db;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)DataCenter *dataCenter;

@property (nonatomic,strong)FMDatabaseQueue *dataBaseQueue;

@end

@implementation SSCDataBaseHandler

- (instancetype)init {
    self = [super init ];
    if (self) {
        [self openDataBase];
        self.dataCenter= [DataCenter sharedDataCenter];
        counter = 0;
    }
    return self;
}

- (NSMutableArray *)columNames {
    
    if (_columNames==nil) {
        _columNames = [[NSMutableArray alloc]initWithObjects:@"cissue",@"ckjtime",@"cn1",@"cn2",@"cn3",@"cn4",@"cn5",nil];
    }
    return _columNames;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataArray;
}

- (void)insertObject:(id)object {
    
    
    [self.dataBaseQueue inDatabase:^(FMDatabase *db) {
        [db open];
        NSDictionary *dict = (NSDictionary *)object;
        BOOL insertResult = [self.db executeUpdate:@"insert into cqssc (cissue,ckjtime,cn1,cn2,cn3,cn4,cn5) values(?,?,?,?,?,?,?)",[dict objectForKey:[self.columNames objectAtIndex:0]],[dict objectForKey:[self.columNames objectAtIndex:1]],[dict objectForKey:[self.columNames objectAtIndex:2]],[dict objectForKey:[self.columNames objectAtIndex:3]],[dict objectForKey:[self.columNames objectAtIndex:4]],[dict objectForKey:[self.columNames objectAtIndex:5]],[dict objectForKey:[self.columNames objectAtIndex:6]]];
        if (insertResult) {
            NSLog(@"insert success!");
            [self performSelectorOnMainThread:@selector(printLog:) withObject:nil waitUntilDone:YES];
        }
        [db close];
    }];
    
   
}

// 打印日志
- (void)printLog:(id)object {
    counter++;
    self.dataCenter.logString =  [NSString stringWithFormat:@"%ld __insert success!",counter];
}

- (id)getObjectWithSql:(NSString *)sqlString {
    return nil;
}

- (void)deleteObjectWithSql:(NSString *)sqlString {
}

- (void)modifyObjectWithSql:(NSString *)sqlString {
}

// 解析json
- (NSArray *)paraseJsonByFilePath:(NSString *)filePath {
    
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSString *fileString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];

    if (error) {
        assert("解析出错了");
    }
    return jsonArray;
}

// 处理数据
- (void)handleData {
    [self setUpDataBase];
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"cqssc－25500" ofType:@"txt"];
//   __block NSArray *jsonArray = [self paraseJsonByFilePath:path];
   [self downloadData];
}

- (NSArray *)downloadData {
    
    __block NSMutableArray *jsonArray = [[NSMutableArray alloc]initWithCapacity:0];
    [[SBHttpRequest getSharedInstance]getWithURLString:[CQSSCURL stringByAppendingString:[[DataCenter sharedDataCenter] limitNumber]] parameters:nil success:^(id responseObject) {
        [[DataCenter sharedDataCenter]setLogString:@"下载完毕"];
       
        jsonArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for ( int i = 0; i < jsonArray.count; i++) {
               
                NSLog(@"%@",[NSThread currentThread]);
               
                NSDictionary *dict = [jsonArray objectAtIndex:i];
                [self insertObject:dict];
            }
        });
        
    } failure:^(NSError *error) {
    }];
    
    NSLog(@"json:%@",jsonArray);
    return jsonArray;
}

#pragma mark  reSave Data
- (void)reSaveData {

    [self setUpDataBase];
    
    // 删除表数据
    [self.dataBaseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdateWithFormat:@"delete from cqssc"];
    }];
    [self handleData];
    
}

- (void)setUpDataBase {
    
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"database path is :%@",docsPath);
    
    NSString *dbPath = [docsPath stringByAppendingPathComponent:@"cqccs.db"];
    [self.dataBaseQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            [self createTable:db tableName:nil];
        }
    }];
}

#pragma mark - 打开数据库
- (void)openDataBase {
    
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"database path is :%@",docsPath);
    NSString *dbPath   = [docsPath stringByAppendingPathComponent:@"cqccs.db"];
    
    self.dataBaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    
    _db = [FMDatabase databaseWithPath:dbPath];
    if (_db) {
        NSLog(@"DataBase open/create success!");
    }
    
    if ([_db open]) {
    }
}

#pragma mark - 创建表
- (void)createTable:(FMDatabase *)dataBase tableName:(NSString *)tableName {
    // 创建表
    NSString *sql = @"create table if not exists cqssc (id integer primary key autoincrement not null,cissue text,ckjtime text,cn1 text,cn2 text,cn3 text,cn4 text,cn5 text);";
    
    BOOL result = [dataBase executeStatements:sql];
    if (result) {
        NSLog(@"创建表success!");
    }
}

// 查询表有多少条数据
- (NSString *)numbersOfTable:(NSString *)tableName {
    
    NSString *sql = [NSString stringWithFormat:@"select count(*) from %@",tableName];
    FMResultSet *result = [self.db executeQuery:sql];
    while ([result next]) {
    return  [result stringForColumn:@"count(*)"];
}
    return 0;
}
#pragma mark 查询所有数据
- (NSArray *)getAllData {
    [[DataCenter sharedDataCenter]setTotalNubmers:[[self numbersOfTable:@"cqssc"] integerValue]];
    ;
    
    NSString *sql = @"select *from cqssc";
    FMResultSet *result = [self.db executeQuery:sql];
    NSLog(@"%@",result);
    NSMutableArray * resultArray = [[NSMutableArray alloc]initWithCapacity:10];
    while ([result next]) {
        NSDictionary *dict = [result resultDictionary];
        [resultArray addObject:dict];
    }
    return resultArray;
}
- (NSInteger)countOftable:(NSString *)tableName {
    
    int64_t totalNumber = [self.db lastInsertRowId];
    return totalNumber;
}
// 查询数据
- (void)searDataFromDataBase:(NSInteger)numbers {

    [self openDataBase];
    SearchData *searchData = [[SearchData alloc]init];
    
//    [[DataCenter sharedDataCenter]setNubmers:
    [[DataCenter sharedDataCenter]setNumber:[NSNumber numberWithInteger:[searchData searchData:[self getAllData] consecutiveNumber:numbers]]];
}

@end
