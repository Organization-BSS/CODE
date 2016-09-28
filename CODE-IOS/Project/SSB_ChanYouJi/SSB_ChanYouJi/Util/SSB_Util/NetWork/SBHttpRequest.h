//
//  SBHttpRequest.h
//  SBDemo_AFNetWorking
//
//  Created by bss on 16/7/12.
//  Copyright © 2016年 bss. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPSessionManager;

#pragma mark 上传图片封装类
@interface UploadParam : NSObject
/**
 *  图片的二进制数据
 */
@property (nonatomic, strong) NSData *data;
/**
 *  服务器对应的参数名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  文件的名称(上传到服务器后，服务器保存的文件名)
 */
@property (nonatomic, copy) NSString *filename;
/**
 *  文件的MIME类型(image/png,image/jpg等)
 */
@property (nonatomic, copy) NSString *mimeType;
@end

/**
 * 继承于NSURLSessionTask，暂不作任何处理
 */
@interface SBURLSessionTask : NSURLSessionTask

@end
#pragma mark 网络请求封装类
/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 0,
    /**
     *  post请求
     */
    HttpRequestTypePost
};

@interface SBHttpRequest : NSObject

// 请求类的回话管理者
@property (nonatomic,strong) AFHTTPSessionManager *sbSesstionManager;

+ (instancetype)getSharedInstance;

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (SBURLSessionTask *)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (SBURLSessionTask *)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;

/**
 *  发送网络请求
 *
 *  @param URLString   请求的网址字符串
 *  @param parameters  请求的参数
 *  @param type        请求的类型
 *  @param resultBlock 请求的结果
 */
+ (SBURLSessionTask *)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 *  上传图片
 *
 *  @param URLString   上传图片的网址字符串
 *  @param parameters  上传图片的参数
 *  @param uploadParam 上传图片的信息
 *  @param success     上传成功的回调
 *  @param failure     上传失败的回调
 */
+ (SBURLSessionTask *)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(UploadParam *)uploadParam
                    success:(void (^)(id))success
                    failure:(void (^)(NSError *error))failure;

/**
 *  上传多张图片
 *
 *  @param URLString   上传图片的网址字符串
 *  @param parameters  上传图片的参数
 *  @param uploadParam 上传图片的的数组
 *  @param success     上传成功的回调
 *  @param failure     上传失败的回调
 */
+ (SBURLSessionTask *)uploadWithURLString:(NSString *)URLString
                               parameters:(id)parameters
                             uploadParams:(NSArray<UploadParam *> *)uploadParams
                                  success:(void (^)(id))success
                                  failure:(void (^)(NSError *))failure;
@end
