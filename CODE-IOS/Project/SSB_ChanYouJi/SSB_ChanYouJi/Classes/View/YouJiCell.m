//
//  YouJiCell.m
//  SSB_ChanYouJi
//
//  Created by bss on 16/9/26.
//  Copyright © 2016年 BSS. All rights reserved.
//

#import "YouJiCell.h"

@implementation YouJiCell

- (IBAction)userHeadClicked:(id)sender {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(YouJiModel *)model {
    _model = model;
    _nameLable.text = model.name;
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:model.front_cover_photo_url] placeholderImage:nil];
    __weak typeof(self) weakself = self;
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:model.front_cover_photo_url] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"%@",[NSValue valueWithCGSize:image.size] );
        UIImage *resizeImage = [weakself cutImage:image];
    
        [_photoImageView setImage:resizeImage] ;
        CGImageRelease(resizeImage.CGImage);

    }];
    UIImage *image = self.photoImageView.image;
    NSLog(@"%@",image);
    
    
}
- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    self.backgroundColor = [UIColor clearColor];
    self.photoImageView.layer.cornerRadius = 5;
    self.photoImageView.layer.masksToBounds = YES;

}

//裁剪图片
- (UIImage *)cutImage:(UIImage*)image
{
    //压缩图片
    CGSize newSize;
    CGImageRef imageRef = nil;
    
    if ((image.size.width / image.size.height) < (self.photoImageView.frame.size.width / self.photoImageView.mj_h)) {
        newSize.width = image.size.width;
        newSize.height = image.size.width * self.photoImageView.frame.size.height / self.photoImageView.frame.size.width;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        newSize.height = image.size.height;
        newSize.width = image.size.height * self.photoImageView.frame.size.width / self.photoImageView.frame.size.height;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
        
    }
    return [UIImage imageWithCGImage:imageRef];
}



@end
