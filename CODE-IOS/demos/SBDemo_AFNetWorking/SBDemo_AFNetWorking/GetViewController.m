//
//  GetViewController.m
//  SBDemo_AFNetWorking
//
//  Created by bss on 16/7/12.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "GetViewController.h"
#import "SBHttpRequest.h"


@interface GetViewController () {
//    __block  NSURLSessionTask *task2;
}
@property (nonatomic,strong)NSURLSessionDataTask *task;
- (IBAction)cnacell:(id)sender;

@end

@implementation GetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self test];
    
    
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
    NSDictionary *dict = @{@"k":@"gwe",@"ife":@"gwe"};
 self.task = [SBHttpRequest getWithURLString:httpUrl parameters:dict success:^(id responseObject) {

        NSLog(@"%@",responseObject);
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
     
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.task cancel];
}
- (IBAction)cnacell:(id)sender {
    [_task cancel];
}
@end
