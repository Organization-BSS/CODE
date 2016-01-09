//
//  Card.h
//  SwiftAndOC_mix
//
//  Created by bss on 1/9/16.
//  Copyright © 2016 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic,strong) NSString *no;
@property (nonatomic,strong) NSString *money;
- (void)pay:(float)money;
+ (void)getCard:(NSInteger)number;
@end
