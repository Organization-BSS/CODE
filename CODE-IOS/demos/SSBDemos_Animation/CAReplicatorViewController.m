//
//  CAReplicatorViewController.m
//  SSBDemos_Animation
//
//  Created by bss on 16/7/5.
//  Copyright © 2016年 bss. All rights reserved.
//

#import "CAReplicatorViewController.h"

@interface CAReplicatorViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CAReplicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    
}

@end
