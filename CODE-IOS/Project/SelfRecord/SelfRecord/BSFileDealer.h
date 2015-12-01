//
//  BSFileDealer.h
//  SelfRecord
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSFileDealer : NSObject

+ (NSString *)appHomeDirectory;
+ (NSString *)appDocumentsDirectoryPath;
+ (NSString *)appLibraryDirectoryPath;
+ (NSString *)creatFolder:(NSString *)folderName;
+ (BOOL)creatFileWithPath:(NSString *)filePath andData:(NSData *)data;
+ (NSArray *)fileNamesInDirectoryPath:(NSString *)directoryPath;
@end
