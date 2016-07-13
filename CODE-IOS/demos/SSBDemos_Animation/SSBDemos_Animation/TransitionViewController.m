//
//  TransitionViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/7.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController () {
    NSArray *images;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)switchImages:(id)sender;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    images = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"下载.jpeg"],[UIImage imageNamed:@"girl.png"]];
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

- (IBAction)switchImages:(id)sender {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [self.imageView.layer addAnimation:transition forKey:nil];
    UIImage *image = self.imageView.image;
    NSUInteger index = [images indexOfObject:image];
    NSInteger inter = (index+1)%images.count;
    self.imageView.image = images[inter];
    
}
@end
