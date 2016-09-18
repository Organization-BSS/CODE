//
//  ViewController.m
//  研究_UI_UIImageAndImageView
//
//  Created by bss on 16/9/1.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addViews {
    UIImageView *ssbImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    UIImage *image = [UIImage imageNamed:@"首页"] ;
    // 获取图片的原始尺寸
    CGSize imageSize = image.size;
    NSLog(@"%@",[NSValue valueWithCGSize:imageSize]);
//    image = [UIImage imageWithCGImage:(__bridge CGImageRef _Nonnull)(image.CIImage) scale:1 orientation:UIImageOrientationUp];
//    NSLog(@"%@",image);
    
    [ssbImageView setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.view addSubview:ssbImageView];
    
}

@end
