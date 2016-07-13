//
//  TransactionViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/5.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "TransactionViewController.h"

@interface TransactionViewController () {
    CALayer *colorLayer;
}

//@property (weak, nonatomic) CALayer *colorLayer;
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (IBAction)changeColor:(id)sender;

@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(10, 10, 200, 200);
//    layer.backgroundColor = [UIColor blueColor].CGColor;
//    [self.view.layer addSublayer:layer];
//    [self.containerView.layer addSublayer:layer];
    colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    colorLayer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.containerView.layer addSublayer:colorLayer];
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
    
    
}
- (IBAction)changeColor:(id)sender {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    colorLayer.backgroundColor = [[UIColor yellowColor]CGColor];
    
    //注意旋转动画要比颜色渐变快得多，这是因为完成块是在颜色渐变的事务提交并出栈之后才被执行，于是，用默认的事务做变换，默认的时间也就变成了0.25秒。
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        colorLayer.affineTransform = transform;
    }];
    [CATransaction commit];
    

}
@end
