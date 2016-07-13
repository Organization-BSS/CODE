//
//  Person.h
//  SBDemo_RunTime
//
//  Created by bss on 16/7/11.
//  Copyright © 2016年 bss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    int age;
    float height;
    float weight;
    NSString *name;
}
@property (nonatomic,strong)NSString *school;
@property (nonatomic,strong)NSString *address;
@property (nonatomic,strong)NSDate *birthDay;

@end
