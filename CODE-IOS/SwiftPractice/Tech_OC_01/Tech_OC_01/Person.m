//
//  Person.m
//  Tech_OC_01
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "Person.h"

@implementation Person

// 方法的实现
- (int)run:(int)numbers {
    
    printf("you should run %d steps\n",numbers);
    int j = 100;
    j = j + numbers;
    printf("j = %d\n",j);
    
    return j;
}

@end
