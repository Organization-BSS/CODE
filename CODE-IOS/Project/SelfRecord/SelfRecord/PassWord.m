//
//  PassWord.m
//  SelfRecord
//
//  Created by bss on 11/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "PassWord.h"

@implementation PassWord
static PassWord * instance = nil;

+ (PassWord *)sharedPassWord {
    if (instance==nil) {
        instance = [[PassWord alloc]init];
    }
    
    return instance;
}
- (id)init {
    self = [super init];
    _number=0;
    array = [[NSMutableArray alloc]initWithObjects:@"063000",@"121700",@"bss",nil];
    return self;
}
- (NSString *)password {
    NSString * pas = [array objectAtIndex:_number];
    _number++;
    return pas;
}

@end
