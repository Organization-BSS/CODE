//
//  SearchData.m
//  SSCDataManager
//
//  Created by bss on 16/10/11.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SearchData.h"

@implementation SearchData

/* 数组类似于[@"3",@"5",@"6"] 模拟连续大*/
//- (NSInteger)searchData:(NSArray *)datas consecutiveNumber:(NSInteger)consecutiveNumber {
//    
//    NSInteger counter = 0; // 计数器
//    NSInteger totalNumber = 0;
//    for (int i = 0; i < datas.count-1; i++) {
//        NSString *stringValue = [datas objectAtIndex:i]; // 获取数组当前的数据
//        NSInteger integerValue = [stringValue integerValue];
//        
//        if ([self dataConformRequirements:integerValue]) { // 此条数据符合条件的情况下
//            counter++;
//            if (counter == consecutiveNumber) {
//                if (![self dataConformRequirements:[[datas objectAtIndex:i+1]integerValue]]) {
//                    totalNumber ++;
//                    counter = 0;
//                }
//            }
//        } else {
//            counter = 0;
//        }
//    }
//    return totalNumber;
//}

- (BOOL)dataConformRequirements:(NSInteger)integerValue {
   
    return integerValue > 4 ; // 连续大
}

- (NSInteger)random {
    
    return arc4random()%10; // 10 范围以内
    /*1、  获取一个随机整数范围在：[0,100)包括0，不包括100
     
     int x = arc4random() % 100;
     
     2、  获取一个随机数范围在：[500,1000），包括500，包括1000
     
     int y = (arc4random() % 501) + 500;
     
     3、  获取一个随机整数，范围在[from,to），包括from，包括to
     
     -(int)getRandomNumber:(int)from to:(int)to
     
     {
     
     return (int)(from + (arc4random() % (to – from + 1)));
     
     }*/
}

// 测试数据
- (NSArray*)testArray {
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i =0; i < 20; i++) {
        [array addObject:[NSString stringWithFormat:@"%ld",[self random]]];
    }
    return array;
}

- (void)test {
    NSArray *arr = [self testArray];
    NSLog(@"fjelwj::%ld",[self searchData:arr consecutiveNumber:3]);
    [self resultCounterArray];
}

- (NSArray *)resultCounterArray {
    
    int a[4][5];
    for (int i = 0; i< 4 ; i++) {
        
        for (int j = 0; j<5; j++) {
            a[i][j] = 0;
            NSLog(@"%d",a[i][j]);
        }
    }
    // 4行5列的数组结构,用于存放
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 4; i++) { // 大 小 单 双
        NSMutableArray *ar = [NSMutableArray arrayWithCapacity:0];
        for (int j = 0; j< 5; j++) { // 万 千 百 十 个
            [ar addObject:@"0"];
        }
        [array addObject:ar];
    }
    NSLog(@"%@",array);
    return array;
}

/*
 datas 是一个以字典为元素的数组
 */
- (NSInteger)searchData:(NSArray *)datas consecutiveNumber:(NSInteger)consecutiveNumber {
    NSInteger totalNumber = 0;

    int a[5][4];  // 存储
    for (int i = 0; i< 5 ; i++) {
        
        for (int j = 0; j<4; j++) {
            a[i][j] = 0;
            NSLog(@"%d",a[i][j]);
        }
    }
    
    
    int _counter[5][4];  // 存储计数器
    for (int i = 0; i< 5 ; i++) {
        
        for (int j = 0; j<4; j++) {
            _counter[i][j] = 0;
            NSLog(@"%d",_counter[i][j]);
        }
    }

    
    NSMutableArray *lastResult = [[NSMutableArray alloc]initWithCapacity:0]; // 存储最后的结果
    for (int i = 0; i < datas.count; i++) {
        NSLog(@"running!!");
        NSDictionary *dict = [datas objectAtIndex:i]; // 获取数组当前下标的数据
        NSMutableArray *values = [[NSMutableArray alloc]initWithCapacity:0];
        // w q b s g
        for (int j = 0; j<5; j++) {
            
            NSString *keyString = [NSString stringWithFormat:@"cn%d",j+1];
            NSString * stringValue = [dict objectForKey:keyString];
            NSInteger integerValue = [stringValue integerValue];
            
            if (integerValue>4) //大
            {
                _counter[j][1] = 0;

                _counter[j][0] ++;
                
                if (_counter[j][0] == consecutiveNumber) {
                    a[j][0]++;
                    _counter[j][0] = 0;
                    [lastResult addObject:dict];
                }
            }
            else // 小
            {
                _counter[j][0] = 0;
                _counter[j][1]++;
                if (_counter[j][1] == consecutiveNumber) {
                    a[j][1]++;
                    _counter[j][1] = 0;
                    [lastResult addObject:dict];

                }
            }
            if (integerValue%2==0) // 双
            {
                _counter[j][3] = 0;
                _counter[j][2] ++;
                if (_counter[j][2] == consecutiveNumber) {
                    a[j][2]++;
                    _counter[j][2] = 0;
                    [lastResult addObject:dict];

                }
            } else // 单
            {
                _counter[j][2]  = 0;

                _counter[j][3] ++;
                if (_counter[j][3] == consecutiveNumber) {
                    a[j][3]++;
                    _counter[j][3] = 0;
                    [lastResult addObject:dict];
                }
            }
        }
    }
        for (int i = 0; i<5; i++) {
            for (int j = 0; j<4; j++) {
                totalNumber += a[i][j];
            }
        }
    for (NSDictionary *dict in lastResult) {
        
        NSLog(@"%@ %@",[dict objectForKey:@"cissue"],[dict objectForKey:@"ckjtime"]);
        [[DataCenter sharedDataCenter] setLogString:[NSString stringWithFormat:@"%@ %@",[dict objectForKey:@"cissue"],[dict objectForKey:@"ckjtime"]]];
    }
        
    return totalNumber;
}
@end
