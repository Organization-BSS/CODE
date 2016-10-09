//
//  SSCSetUp.m
//  SSCReminder
//
//  Created by bss on 16/10/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "SSCSetUp.h"
#import "AudioToolbox/AudioToolbox.h"
// http://www.cp66607.com/api/xjssc?act=index&requestday=2016-10-08
// http://m.1396mp.com/api/ssc/history?date=1435855200

@interface SSCSetUp()
@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,strong)NSMutableArray *numberDatas;
@end

@implementation SSCSetUp

- (void)setup {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.secondInterval*60 target:self selector:@selector(request:) userInfo:nil repeats:YES];
   [timer fire];
}

- (NSInteger)secondInterval {
    
    if (_secondInterval==0) {
        self.secondInterval = 2;
    }
    return _secondInterval;
}

- (NSInteger)reminderSize {
    
    if (_reminderSize==0) {
        _reminderSize = 2;
    }
    return _reminderSize;
}


- (NSMutableArray *)numberDatas {
    if (_numberDatas==nil) {
        _numberDatas = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _numberDatas;
}

- (void)request:(id)object {
    
    NSString *url = nil;
    if (self.sscType==SSCTYPE_CQ) {
        url = [self cxSSCUrl];
        
    } else {
        url = [self xjSSCUrl];
    }

    [SBHttpRequest.getSharedInstance getWithURLString:url parameters:nil success:^(id responseObject) {
        [self.numberDatas removeAllObjects];
        // cq
        if (self.sscType==SSCTYPE_CQ) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"result:%@",[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
            
            NSArray *resultList = [dict objectForKey:@"itemArray"];
                if (resultList.count>15) {
                    self.datas = [NSMutableArray arrayWithArray:[resultList subarrayWithRange:NSMakeRange(0, 15)]];
                } else {
                    self.datas = [NSMutableArray arrayWithArray:resultList];
                }
                
                // 将号码添加到数组中，号码以数组的形式存储
                for (NSArray * arr in self.datas) {
                    NSString *numberString = arr.lastObject;
                    NSArray *numbers = [numberString componentsSeparatedByString:@","];
                    [self.numberDatas addObject:numbers];
                }
            
        }
        //xj
        else {
          /* 数据如此类
           [
           {
           "xn1": "4",
           "xn2": "9",
           "xn3": "2",
           "xn4": "3",
           "xn5": "1",
           "xkjtime": "11:20",
           "xissue": "2016100908",
           "xsum": "19",
           "xSumBL": 0,
           "xSumOE": 1,
           "xDT": 2,
           "xFront3": "杂六",
           "xMiddle3": "半顺",
           "xLast3": "顺子"
           },
           {
           "xn1": "7",
           "xn2": "0",
           "xn3": "5",
           "xn4": "1",
           "xn5": "4",
           "xkjtime": "11:10",
           "xissue": "2016100907",
           "xsum": "17",
           "xSumBL": 0,
           "xSumOE": 1,
           "xDT": 2,
           "xFront3": "杂六",
           "xMiddle3": "半顺",
           "xLast3": "半顺"
           },
           {
           "xn1": "7",
           "xn2": "9",
           "xn3": "7",
           "xn4": "6",
           "xn5": "6",
           "xkjtime": "11:00",
           "xissue": "2016100906",
           "xsum": "35",
           "xSumBL": 1,
           "xSumOE": 1,
           "xDT": 2,
           "xFront3": "对子",
           "xMiddle3": "半顺",
           "xLast3": "对子"
           },
           */
            NSArray *resultList = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"result:%@",[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
            
            if (resultList.count>15) {
                self.datas = [NSMutableArray arrayWithArray:[resultList subarrayWithRange:NSMakeRange(0, 15)]];
            } else {
                self.datas = [NSMutableArray arrayWithArray:resultList];
            }
            

            // 将号码添加到数组中，号码以数组的形式存储
            for (NSDictionary * dict in self.datas) {
                NSMutableArray *numbers = [[NSMutableArray alloc]initWithCapacity:0];
                [numbers removeAllObjects];
                for (int i = 1; i < 6; i++) {
                    NSString *string = [NSString stringWithFormat:@"xn%d",i];
                    [numbers addObject:[dict objectForKey:string]];
                }
                // numbers存放的数据结构为：[@"2",@"3",@"5",@"6",@"8"]
                [self.numberDatas addObject:numbers];
            }
        }
        NSLog(@"%@",self.numberDatas);
        if ([SortJudge reminderUserWithData:self.numberDatas sortSize:self.reminderSize]) {
            [self alertUser];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (NSString *)cxSSCUrl {
//   NSString *url = @"http://m.1396mp.com/api/ssc/history?date=";
//    NSDate * date = [NSDate date];
//    double interval = date.timeIntervalSince1970;
//    NSString *absolueUrl = [NSString stringWithFormat:@"%@%lf",url,interval];
//    return absolueUrl;

    NSString *url = @"http://m.1396mp.com/api/ssc/history";
    return url;

    
    
}

- (NSString *)xjSSCUrl {
    
    NSString *url = @"http://www.cp66607.com/api/xjssc?act=index&requestday=";
    NSDate * date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *absolueUrl = [NSString stringWithFormat:@"%@%@",url,[dateFormatter stringFromDate:date]];
    return absolueUrl;
}

- (void)alertUser {
    AppDelegate * delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate.player play];
    
}

- (void)virbrate {
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}
@end
