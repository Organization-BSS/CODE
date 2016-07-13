//
//  UploadPictureViewController.m
//  SBDemo_AFNetWorking
//
//  Created by bss on 16/7/12.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "UploadPictureViewController.h"
#import "SBHttpRequest.h"

@class UploadParam;


@interface UploadPictureViewController ()

@end

@implementation UploadPictureViewController

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

- (void)test {
    
#pragma mark 单张图片
//    UIImage *image = [UIImage imageNamed:@"1.png"];
//    UploadParam *uploadParam = [[UploadParam alloc]init];
//    uploadParam.data = UIImagePNGRepresentation(image);
//    uploadParam.filename = @"1.png";
//    uploadParam.mimeType = @"image/png";
//    uploadParam.name = @"fwe";
//    NSString *url = @"http://127.0.0.1:8080/OHJJ/servlet/UPload";
//    [SBHttpRequest uploadWithURLString:url parameters:nil uploadParam:uploadParam success:^(id responseObject){
//        
//    } failure:^(NSError *error) {
//        
//    }];
#pragma mark 多张图片
    NSMutableArray<UploadParam *> *array = [NSMutableArray array];
    for (int i = 1;i< 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i]];
        UploadParam *uploadParam = [[UploadParam alloc]init];
        uploadParam.data = UIImagePNGRepresentation(image);
        uploadParam.filename = [NSString stringWithFormat:@"%i.jpg",i];
        uploadParam.mimeType = @"image/jpg";
        uploadParam.name = uploadParam.filename;
        [array addObject:uploadParam];
    }
    NSString *url = @"http://127.0.0.1:8080/OHJJ/servlet/UPload";
    [SBHttpRequest uploadWithURLString:url parameters:nil uploadParams:array success:^(id object) {
        
    } failure:^(NSError * error) {
        
    }];
    
 
    
    
    
    
    
}

@end
