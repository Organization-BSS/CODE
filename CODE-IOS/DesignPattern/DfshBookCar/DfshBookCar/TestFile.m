//
//  TestFile.m
//  DfshBookCar
//
//  Created by bss on 12/2/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "TestFile.h"
#import "JSONKit.h"

@implementation TestFile

- (void)test {

   
//
//    NSString *body = @"{\"appToken\":\"<xml><Version>1.2.1</Version><AppID>dfssiphone</AppID><AppSecret>E42E0A6D8CBF13E2</AppSecret></xml>\", \"dataString\":\"<xml><Signatrue>cf2b2b74f578d979f24e05b3cafb66a7</Signatrue><fchrOrgCode>666<rOrgCode><fchrStudentID>25013143<rStudentID><RN>17995365</RN><AppID>dfssiphone</AppID><AppSecret>E42E0A6D8CBF13E2</AppSecret><fchrPassWord>12070<rPassWord></xml>\"}";
//    NSLog(@"%@",body);
//    NSError *error = nil;
//       NSString *userInfo = [ NSJSONSerialization JSONObjectWithData :[body dataUsingEncoding : NSUTF8StringEncoding ] options : NSJSONReadingMutableLeaves error :&error];
//    if(error) {
//        NSLog(@"error :%@",error);
//    }
//    
//    NSLog(@"%@",userInfo);
//
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSDictionary *parameters = @{@"foo": userInfo};
//    [manager POST:@"http://api.dfss.com.cn/appService.svc/GetCoachByStu" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//    NSString *ST = @"\"";
////    NSLog(@"%@",ST);
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //传入的参数
    NSDictionary *parameters = @{@"appToken":@"<xml><AppID>dfssandroid</AppID><AppSecret>A4EB886E99F59CEA</AppSecret><Version>1.2.0</Version></xml>",@"dataString":@"<xml><fchrStudentID>25013144</fchrStudentID><AppID>dfssandroid</AppID><RN>75153030</RN><AppSecret>A4EB886E99F59CEA</AppSecret><Signatrue>91027cb44243c46e0624c5ade30ccb32</Signatrue><fchrPassWord>06300</fchrPassWord><fchrOrgCode>666</fchrOrgCode></xml>"};
    //你的接口地址
    NSString *url=@"http://api.dfss.com.cn/appService.svc/GetCarList";//@"http://api.dfss.com.cn/appService.svc/GetCoachByStu";
    //发送请求
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dis = (NSDictionary *)responseObject;
//        NSDictionary *dict = [dis objectFromJSONStringWithParseOptions:JKParseOptionValidFlags error:nil];
        NSString *value = [dis objectForKey:@"Value"];
        
   
        NSLog(@"%@",dis);
        NSLog(@"%@",value);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
