//
//  PostViewController.m
//  SBDemo_AFNetWorking
//
//  Created by bss on 16/7/12.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "PostViewController.h"
#import "SBHttpRequest.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// test
- (void)test {
    NSString *httpUrl = @"http://10.8.233.2:8080/TestJavaWeb/TestJsonServlet";
    // 拼接请求参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
         params[@"client_id"] = @"2331570398";
         params[@"client_secret"] = @"240608336b729e27685af0ec496c1a60";
         params[@"grant_type"] = @"authorization_code";
         params[@"code"] = @"http://";
    [SBHttpRequest postWithURLString:httpUrl parameters:params success:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}

@end
