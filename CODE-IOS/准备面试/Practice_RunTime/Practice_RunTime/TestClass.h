//
//  TestClass.h
//  Practice_RunTime
//
//  Created by bss on 6/4/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject {
    int age;
    NSNumber *number;
    NSString * string;
    float height;
}

@property (nonatomic,strong)NSString  *address;
@property (nonatomic,strong)NSString  *province;

- (int)age;
- (float)height;
- (void)setAge:(int)age Height:(float)height;

@end
