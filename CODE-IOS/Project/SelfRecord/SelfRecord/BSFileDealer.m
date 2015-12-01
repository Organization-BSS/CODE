//
//  BSFileDealer.m
//  SelfRecord
//
//  Created by bss on 11/28/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "BSFileDealer.h"
#define APPFILEMANAGER     [NSFileManager defaultManager]


@implementation BSFileDealer

// app的doucuments路径
+ (NSString *)appDocumentsDirectoryPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

// app路径
+ (NSString *)appHomeDirectory {
    return NSHomeDirectory();
}

// app的library路径
+ (NSString *)appLibraryDirectoryPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

// 创建文件夹
+ (NSString *)creatFolder:(NSString *)folderName {
    BOOL  creatFoldSuccess = [APPFILEMANAGER createDirectoryAtPath:[[BSFileDealer appDocumentsDirectoryPath] stringByAppendingPathComponent:folderName] withIntermediateDirectories:YES attributes:nil error:nil];
    if (creatFoldSuccess) {
        return [[BSFileDealer appDocumentsDirectoryPath] stringByAppendingPathComponent:folderName] ;
    } else {
        NSLog(@"create folder fail");
        return nil;
    }
}

+ (BOOL)creatFileWithPath:(NSString *)filePath andData:(NSData *)data {
    BOOL creatFileSuccess = [APPFILEMANAGER createFileAtPath:filePath contents:data attributes:nil];
    return creatFileSuccess;
}

+ (NSArray *)fileNamesInDirectoryPath:(NSString *)directoryPath {
    return [APPFILEMANAGER contentsOfDirectoryAtPath:directoryPath error:nil];
}
@end
