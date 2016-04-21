//
//  Test_afnetworking.h
//  Practice_Network
//
//  Created by bss on 4/15/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

/*
 This file is aimed to test
*/

#import <Foundation/Foundation.h>
@class AFURLSessionManager;
@protocol NSURLSessionTaskDelegate;
@interface Test_afnetworking : NSObject <NSURLSessionDataDelegate>{
    AFURLSessionManager *urlManager;
}

- (void)test_AF_get; // 测试get方法
- (void)test_AF_post; // 测试post方法

// A DOWNLOAD TASK
- (void)downloadFiles;
- (void)suspendDownloadFile;
- (void)goonDownload;

/**原生态的网络请求*/
- (void)originNetWork;

@end
