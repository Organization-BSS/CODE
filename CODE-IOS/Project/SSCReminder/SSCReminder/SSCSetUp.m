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
    
   NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.secondInterval target:self selector:@selector(request:) userInfo:nil repeats:YES];
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
        _reminderSize = 5;
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
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        [self.numberDatas removeAllObjects];
        // cq
        if (self.sscType==SSCTYPE_CQ) {
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
            NSLog(@"%@",self.numberDatas);
            if ([SortJudge reminderUserWithData:self.numberDatas sortSize:self.reminderSize]) {
                [self alertUser];
            }
            
        } else {
            //xj
        }
        
//        NSLog(@"%@",dict);
        
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
    
    
}

- (void)virbrate {
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}
@end
