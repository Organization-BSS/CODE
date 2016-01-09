//
//  Person+CoreDataProperties.h
//  Study_CoreData-01-2015_12_28
//
//  Created by bss on 12/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSNumber *sex;
@property (nullable, nonatomic, retain) NSManagedObject *card;

@end

NS_ASSUME_NONNULL_END
