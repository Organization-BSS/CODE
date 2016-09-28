//
//  SBHttpRequest.m
//  SBDemo_AFNetWorking
//
//  Created by bss on 16/7/12.
//  Copyright © 2016年 bss. All rights reserved.
//
#pragma mark 相关的宏定义



#import "SBHttpRequest.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

#pragma mark UploadParam
@implementation UploadParam

@end

#pragma mark SBURLSessionTask
@implementation SBURLSessionTask

@end

@interface SBHttpRequest ()

@end

@implementation SBHttpRequest
static SBHttpRequest *singleton = nil;

+ (void)load {
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// 使用gcd获取网络请求的单例类
+ (instancetype)getSharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[SBHttpRequest alloc] init];
    });
    singleton.sbSesstionManager = [[self class] configureSessionManager];
    singleton.sbSesstionManager.securityPolicy.allowInvalidCertificates = YES;
    [[self class] configureOther];
    
    return singleton;
}

// 设置网络会话管理器
+ (AFHTTPSessionManager *)configureSessionManager {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    /**
     *  可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    /**
     *  请求队列的最大并发数
     */
    manager.operationQueue.maxConcurrentOperationCount = 10;
    /**
     *  请求超时的时间
     */
    manager.requestSerializer.timeoutInterval = 30;
    // 设置返回数据的类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
    
    return manager;
}

// 设置其他相关的操作
+ (void)configureOther {
    [UIApplication sharedApplication].networkActivityIndicatorVisible= YES;
}
#pragma mark -- GET请求 --
- (SBURLSessionTask *)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure {
    
   return (SBURLSessionTask *)[self.sbSesstionManager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST请求 --
+ (SBURLSessionTask *)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [self configureSessionManager];
   return (SBURLSessionTask *)[manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST/GET网络请求 --
+ (SBURLSessionTask *)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id))success
                     failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [self configureSessionManager];
    SBURLSessionTask *task = nil;
    switch (type) {
        case HttpRequestTypeGet:
        {
           task = (SBURLSessionTask *)[manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            task = (SBURLSessionTask *)[manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
    }
    return task;
}

#pragma mark -- 上传图片 --
+ (SBURLSessionTask *)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(UploadParam *)uploadParam
                    success:(void (^)(id))success
                    failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [self configureSessionManager];
   return (SBURLSessionTask *)[manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

#pragma mark -- 上传多张图片 --
+ (SBURLSessionTask *)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParams:(NSArray<UploadParam *> *)uploadParams
                    success:(void (^)(id))success
                    failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [self configureSessionManager];
    return (SBURLSessionTask *)[manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UploadParam * param in uploadParams) {
            [formData appendPartWithFileData:param.data name:param.name fileName:param.filename mimeType:param.mimeType];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
@end
