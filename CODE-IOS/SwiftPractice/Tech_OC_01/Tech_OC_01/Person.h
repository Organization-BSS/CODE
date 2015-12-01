//
//  Person.h
//  Tech_OC_01
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

// 类 ：1.类成员变量 2. 类的方法


#import <Foundation/Foundation.h>

@interface Person : NSObject {
    // 类的成员变量的定义 必须在｛｝里边
    int age;
    float height;
}

// 定义类的方法：表示这个类所持有的行为
- (int)run:(int)numbers;

@end