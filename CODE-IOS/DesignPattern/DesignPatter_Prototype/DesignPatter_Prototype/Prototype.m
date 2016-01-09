//
//  Prototype.m
//  DesignPatter_Prototype
//
//  Created by bss on 12/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "Prototype.h"

@implementation Prototype
// 原型模式测试例子
+ (void)prototypeTest:(id)object  {

    // 数据模型
    DataModel *model = [[DataModel alloc]init];
    
    // 填充模型数据
    model.name = @"Jony";
    model.age = 23;
    model.date = [NSDate date];
    
    // 开启对比情况选择标志
    int flag = 1; // 1 表示原型模式 非表示非原型模式
    if(flag){
        // 循环体中使用原型模式，实现深拷贝
        for (int i = 0; i< 10001; i++) {
            if(i==0)
                NSLog(@"%@",[NSDate date]);
            DataModel *mod = [model mutableCopy];
            mod.name = @"Frandkly";
            mod.date = [NSDate dateWithTimeIntervalSince1970:235325325];
            mod.sex = 0;
            mod.age = 78;
            NSLog(@"%@,",mod.name);
            if (i == 10000) {
                NSLog(@"原型模式");
                NSLog(@"%@",[NSDate date]);
                
            }
        }

    }
    else {
        for (int i = 0; i<10001; i++) {
            if(i==0)
                NSLog(@"%@",[NSDate date]);
            DataModel *mod = [[DataModel alloc]init]  ;
            mod.name = @"Frandkly";
            mod.date = [NSDate dateWithTimeIntervalSince1970:235325325];
            mod.sex = 0;
            mod.age = 78;
            NSLog(@"%@,",mod.name);
            if (i == 10000) {
                NSLog(@"一般alloc");
                NSLog(@"%@",[NSDate date]);
                
            }
        }
        

    }
    
}

@end
