//
//  PassWord.h
//  SelfRecord
//
//  Created by bss on 11/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PassWord : NSObject {
    NSMutableArray * array ;
}
+ (PassWord *)sharedPassWord;
- (NSString *)password;
@property (assign, nonatomic) int number;

@end
