//
//  MaskViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/6/30.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 20, 50, 50);
    UIImage  *image = [UIImage imageNamed:@"1.jpg"];
    layer.contents = (__bridge id)image.CGImage;
    self.showImageView.layer.mask = layer;
    
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
