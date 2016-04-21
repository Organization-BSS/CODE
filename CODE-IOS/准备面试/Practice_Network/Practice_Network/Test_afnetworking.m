//
//  Test_afnetworking.m
//  Practice_Network
//
//  Created by bss on 4/15/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import "Test_afnetworking.h"
#import <AFNetworking.h>
NSString * const apikey = @"2a63df1e483643886eecab7b12764eed";

@implementation Test_afnetworking

// 测试get方法
- (void)test_AF_get {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    [session GET:@"http://127.0.0.1:8080/TestForIosNetworking/Handle" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject){
        NSLog(@"task is %lld",task.countOfBytesReceived);
        NSLog(@"success:%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"%@",error);
        
    }
     ];
    
}

// 测试post方法
- (void)test_AF_post {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:apikey forHTTPHeaderField:@"apikey"];
    NSDictionary *dict = @{@"name":@"宫保鸡丁"};
    [manager POST:@"http://apis.baidu.com/tngou/cook/name" parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        // NSData转为NSString
        NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonStr);
        NSLog(@"task is %lld",task.countOfBytesReceived);
        NSLog(@"success:%@",[NSString stringWithFormat:@"%@",jsonStr]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

// A DOWNLOAD TASK
- (void)downloadFiles {
    [self originNetWork];
    return;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    urlManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    urlManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSURL *URL = [NSURL URLWithString:@"http://download.xmcdn.com/group9/M07/28/99/wKgDZlbvLUSBVtqwACGcGBYdGQk922.m4a"];
//http://127.0.0.1:8080/TestForIosNetworking/Handle
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [urlManager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress) {
            NSLog(@"downloadprogress :%@",downloadProgress);
        
        } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            NSLog(@"response is:%@",response);
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            NSLog(@"File downloaded to: %@", filePath);
        }];
    
    [urlManager setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
            NSLog(@"%lld,%lld,%lld,",bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
            double b = (double)totalBytesWritten/474065315;
            NSLog(@"this is 百分数为:%.0f%%",b*100);
        }];
    
    [urlManager setDataTaskDidReceiveDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDataTask * _Nonnull dataTask, NSData * _Nonnull data) {
        NSLog(@"fewf%@",data);
    }];
    
    

    
        [downloadTask resume];
}

- (void)suspendDownloadFile {
    NSURLSessionDownloadTask *task = (NSURLSessionDownloadTask *)[[urlManager tasks]lastObject];
    [task suspend];
    
//    [task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
//        
//        NSLog(@"%@",resumeData);
//    }];
    
}
- (void)goonDownload {
    NSURLSessionTask *task2 = [[urlManager tasks]lastObject];
    [task2 resume];
    return;
    
    NSURLSessionDownloadTask *task = (NSURLSessionDownloadTask *)[[urlManager tasks]lastObject];
    [urlManager downloadTaskWithResumeData:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"goon download");
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"File downloaded to: %@", filePath);

    }];
    
}
/**原生态的网络请求*/
- (void)originNetWork {
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://download.xmcdn.com/group9/M07/28/99/wKgDZlbvLUSBVtqwACGcGBYdGQk922.m4a"]];
    NSURLSession *Session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *download = [Session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"data;%@",data);
        NSLog(@"response:%@",response);
    }];
   
    [download resume];
}

- (void)URLSession:(NSURLSession *)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveData:(nonnull NSData *)data {
    
    
    NSLog(@"this is data:%@",data);
}
@end
