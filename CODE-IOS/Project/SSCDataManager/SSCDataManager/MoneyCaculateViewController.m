//
//  MoneyCaculateViewController.m
//  SSCDataManager
//
//  Created by bss on 16/10/13.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "MoneyCaculateViewController.h"

@interface MoneyCaculateViewController ()

@property (weak, nonatomic) IBOutlet UITextField *timesTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstMoneyaTextField;
@property (weak, nonatomic) IBOutlet UITextField *nMoneyTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalMoneyTextField;
@property (nonatomic,strong)NSMutableArray *moneysArray;

@end

@implementation MoneyCaculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)moneysArray {
    if (_moneysArray == nil) {
        _moneysArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _moneysArray;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark buttonActions 

- (IBAction)backLastVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)makeSure:(id)sender {
    
    NSInteger time = [_timesTextField.text integerValue];
    [self.moneysArray removeAllObjects];
    
    [self.moneysArray addObject:_firstMoneyaTextField.text];
    
    for (int i = 1; i < time; i++) {
        
        float requiredMoney = 0;
        float sum = 0;
        
        for (int j = 0; j < i; j++) {
            NSString *value = [self.moneysArray objectAtIndex:j];
            float money = [value floatValue];
            sum += money;
        }
        
        requiredMoney = sum*10/9;
        [self.moneysArray addObject:[NSString stringWithFormat:@"%lf",requiredMoney]];
    }
    _nMoneyTextField.text = [self.moneysArray objectAtIndex:time - 1];
    
    float totalMoney = 0;
    for (NSString *perMoney in self.moneysArray) {
        totalMoney += [perMoney floatValue];
    }
    _totalMoneyTextField.text = [NSString stringWithFormat:@"%lf",totalMoney];
}

@end
