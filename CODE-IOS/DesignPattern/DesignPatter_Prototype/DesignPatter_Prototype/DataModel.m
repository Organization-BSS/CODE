//
//  DataModel.m
//  DesignPatter_Prototype
//
//  Created by bss on 12/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (id)mutableCopyWithZone:(NSZone *)zone {
    
    DataModel *model = [[[self class]allocWithZone:zone]init];
    model.name = [_name copy];
    model.date = [_date copy];
    model.age = _age;
    model.sex = _sex;
    return model;
}


@end
