//
//  AIHomeTitleButton.m
//  AISian
//
//  Created by 艾泽鑫 on 15/9/29.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "AIHomeTitleButton.h"
#import "AIDefine.h"
@implementation AIHomeTitleButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置图片居中
        [self.imageView setContentMode:(UIViewContentModeCenter)];
        [self.imageView setBackgroundColor:[UIColor redColor]];
        [self.titleLabel setBackgroundColor:[UIColor greenColor]];
        //设置文字右对齐
        [self.titleLabel setTextAlignment:(NSTextAlignmentRight)];
        
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat W = contentRect.size.width - self.imageView.frame.size.width;
//    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
//    dictM[NSFontAttributeName] = AINavigationTitleFont;
//    CGFloat W = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dictM context:nil].size.width;
    CGFloat H = contentRect.size.height;
    return CGRectMake(X, Y, W, H);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
   
    CGFloat Y = 0;
    CGFloat W = contentRect.size.height;
    CGFloat H = contentRect.size.height;
    CGFloat X = contentRect.size.width - W;
    return CGRectMake(X, Y, W, H);
}
@end
