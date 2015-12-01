//
//  addContentViewController.m
//  SelfRecord
//
//  Created by bss on 11/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "addContentViewController.h"
#import "BSFileDealer.h"
NSString *const txtName = @"description.txt";

@interface addContentViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    NSInteger currentButtonTag;
    NSMutableArray  *filePathsArray;
    
}

@end

@implementation addContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    filePathsArray = [[NSMutableArray alloc]initWithCapacity:0];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]init];
    [tap2 addTarget:self action:@selector(hideView:)];
    [self.largImageView addGestureRecognizer:tap2];
    
    imagesArray = [[NSMutableArray alloc]initWithCapacity:0];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(resignResponser:)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}
- (void)hideView:(id)object {
    _largImageView.hidden = YES;
}
- (void)viewDidAppear:(BOOL)animated {
   
    if (_type==VCTYPE_SHOW) {
        _textView.editable = NO;
        _textView.userInteractionEnabled = NO;
        _textView.text = [NSString stringWithContentsOfFile:[_path stringByAppendingString:[NSString stringWithFormat:@"/%@",txtName]] encoding:NSUTF8StringEncoding error:nil];
        NSArray *ar = [BSFileDealer fileNamesInDirectoryPath:[_path stringByAppendingPathComponent:@"image"]];
        
        for (NSString *str in ar) {
            NSString *imageFilePath = [[_path stringByAppendingPathComponent:@"image"]stringByAppendingPathComponent:str];
            if ([str hasSuffix:@"png"]) {
                [filePathsArray addObject:imageFilePath];
                [self refreshButton];
            }
        }
        _sureButton.hidden = YES;
    }
    
}
- (void)resignResponser:(id)object {
    [self.view endEditing:YES];
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

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonPressed:(id)sender {
    UIButton *bu = (UIButton *)sender;
    currentButtonTag = bu.tag;
 
    if (_type==VCTYPE_SHOW) {
        [_largImageView setImage:[UIImage imageWithContentsOfFile:[filePathsArray objectAtIndex:currentButtonTag-1]]];
        _largImageView.hidden = NO;
        } else {
        
        UIImagePickerController *pikcer = [[UIImagePickerController alloc]init];
        pikcer.delegate = self;
        pikcer.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:pikcer animated:YES completion:nil];
    }
    
}

- (IBAction)makeSure:(id)sender {
    [self saveData];
}

#pragma mark --
#pragma mark delegate method
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSLog(@"%@",info);
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (imagesArray.count<3)
      [imagesArray addObject:image];
    else
        [imagesArray setObject:image atIndexedSubscript:currentButtonTag-1];
    
    self.largImageView.image = image;
    self.largImageView.hidden = NO;
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self refreshButton];
}

- (void)refreshButton {
    if (_type==VCTYPE_SHOW) {
        int i = 0;
        for (NSString *imPath in filePathsArray) {
            UIButton *bu = (UIButton *)[self.view viewWithTag:i+1];
            i++;
            [bu setBackgroundImage:[UIImage imageWithContentsOfFile:imPath] forState:UIControlStateNormal];
        }
    } else {
        int i = 0;
        for (UIImage *im in imagesArray) {
            UIButton *bu = (UIButton *)[self.view viewWithTag:i+1];
            i++;
            [bu setBackgroundImage:im forState:UIControlStateNormal];
        }
    }
  
}

- (void)saveData {
    NSString *documentPath = [BSFileDealer appDocumentsDirectoryPath];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    NSString *dateString = [formatter stringFromDate:date];
    NSLog(@"%@",dateString);
    NSArray *ar = [dateString componentsSeparatedByString:@"/"];
    NSString *folderName = [ar componentsJoinedByString:@"_"];
    
    BOOL bo = [BSFileDealer creatFolder:folderName];
    if (bo) {
        NSString *folderPath = [documentPath stringByAppendingPathComponent:[NSString  stringWithFormat:@"%@",folderName]];
                                
        [self.textView.text writeToFile:[documentPath stringByAppendingPathComponent:[NSString  stringWithFormat:@"%@/%@",folderName,txtName]] atomically:YES encoding:NSUTF8StringEncoding error:nil];
        [BSFileDealer creatFolder:[NSString stringWithFormat:@"%@/image",folderName]];

        int j = 1;
      
        for (UIImage *im in imagesArray) {
            NSData *data = UIImagePNGRepresentation(im);
            [data writeToFile:[folderPath stringByAppendingString:[NSString stringWithFormat:@"/image/%d.png",j]] atomically:YES];

            j++;
        }
        NSLog(@"%@",[folderPath stringByAppendingString:[NSString stringWithFormat:@"/image/%d.png",j]]);
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
@end
