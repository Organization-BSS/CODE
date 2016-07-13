//
//  CGAffineTransformViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/1.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "CGAffineTransformViewController.h"

@interface CGAffineTransformViewController ()

@end

@implementation CGAffineTransformViewController

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

// 测试入口
- (void)test {
    /*CGAffineTransformMakeRotation(CGFloat angle)
    CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
    CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)
     */
    CGAffineTransform transform = CGAffineTransformIdentity;
  
    // 设置缩放比例
    transform = CGAffineTransformScale(transform, 2, 2);
    
    // 设置旋转
    transform = CGAffineTransformMakeRotation(M_PI_2);
    
    // 平移
    transform = CGAffineTransformTranslate(transform, 500, 0);
    
    
    self.girlView.layer.affineTransform = transform;
    
}

@end
