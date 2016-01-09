//
//  DataModel.h
//  DesignPatter_Prototype
//
//  Created by bss on 12/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject <NSMutableCopying>

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,assign) BOOL sex;
@property (nonatomic,assign) NSInteger age;

@end
