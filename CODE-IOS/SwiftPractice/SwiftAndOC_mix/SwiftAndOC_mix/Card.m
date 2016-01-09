//
//  Card.m
//  SwiftAndOC_mix
//
//  Created by bss on 1/9/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

#import "Card.h"

@implementation Card
- (void)pay:(float)money {
    NSLog(@"pay money%f",money);
}
+ (void)getCard:(NSInteger)number {
    NSLog(@"car number is: %ld",(long)number);
}
@end
