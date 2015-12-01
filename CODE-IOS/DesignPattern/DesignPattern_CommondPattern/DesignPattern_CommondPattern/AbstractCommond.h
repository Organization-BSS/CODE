//
//  AbstractCommond.h
//  DesignPattern_CommondPattern
//
//  Created by bss on 12/1/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractCommond : NSObject

@end

// 命令接口
@protocol Commond <NSObject>

@required
- (void)execute:(id)object;

@end
