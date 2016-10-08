//
//  SSCRequest.h
//  SSCReminder
//
//  Created by bss on 16/10/8.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSCRequest : NSObject

@property(nonatomic,strong)NSString *url;
- (void)request;
@end
