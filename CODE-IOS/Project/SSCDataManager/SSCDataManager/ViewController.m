//
//  ViewController.m
//  SSCDataManager
//
//  Created by bss on 16/10/10.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    DataCenter *dataCenter;
}

@property (weak, nonatomic) IBOutlet UITextField *consecutiveNumberTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"arc4random  %u",arc4random()%10);
    [self observData];
//    SearchData *search = [[SearchData alloc]init];
//    [search test];

    [self setUpHandleDataBase];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)makeSure:(id)sender {
    
    self.logTextView.text = nil;
    
    SSCDataBaseHandler *handler = [[SSCDataBaseHandler alloc]init];
    [handler searDataFromDataBase:[self.consecutiveNumberTextField.text integerValue]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 进入数据库操作
- (void)setUpHandleDataBase {
//    SSCDataBaseHandler *handler = [[SSCDataBaseHandler alloc]init];
////    [handler handleData];
//    [handler searDataFromDataBase];

}

- (IBAction)reLoadData:(id)sender {
    
    dataCenter.limitNumber = self.limitNumberTextField.text;
    SSCDataBaseHandler *handler = [[SSCDataBaseHandler alloc]init];
    [handler reSaveData];
    
}

- (void)observData {
    
    dataCenter = [DataCenter sharedDataCenter];
    
    [dataCenter addObserver:self forKeyPath:@"logString" options:NSKeyValueObservingOptionNew context:nil];
    
//    nubmers
    [dataCenter addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew context:nil];
    
    [dataCenter addObserver:self forKeyPath:@"totalNubmers" options:NSKeyValueObservingOptionNew context:nil];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"number"]) {
        self.timesLable.text = [NSString stringWithFormat:@"%@",dataCenter.number];
    } else {
        if ([keyPath isEqualToString:@"totalNubmers"]) {
            self.totalNumbers.text = [NSString stringWithFormat:@"%ld",dataCenter.totalNubmers];
        }
        else {
            [self performSelectorOnMainThread:@selector(changeViewValue:) withObject:keyPath waitUntilDone:YES];
    }
    }
}

- (void)changeViewValue:(id)ojbect {
    self.logTextView.text = [dataCenter.logString stringByAppendingFormat:@"\n%@", self.logTextView.text];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
