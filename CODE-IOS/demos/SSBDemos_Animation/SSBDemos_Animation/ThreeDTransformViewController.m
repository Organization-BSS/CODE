//
//  ThreeDTransformViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/4.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "ThreeDTransformViewController.h"

@interface ThreeDTransformViewController ()

@end

@implementation ThreeDTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // around y axis
    CATransform3D  transform3D = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    
//    // 改变视角
//    CATransform3D transform = CATransform3DIdentity;  // 默认的transform3d
//    transform.m34 = -25/500;
//    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
//    
//    //apply perspective transform to container
//    CATransform3D perspective = CATransform3DIdentity;
//    perspective.m34 = - 1.0 / 500.0;
//    self.GirlView.layer.sublayerTransform = perspective;
//    //rotate layerView1 by 45 degrees along the Y axis
//    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
//    self.GirlView.layer.transform = transform1;
//    //rotate layerView2 by 45 degrees along the Y axis
//    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
//    self.GirlView.layer.transform = transform2;
//    self.GirlView.layer.transform = transform;
    
    
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

@end
