//
//  AIStatusPhotoView.m
//  AISian
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIStatusPhotoView.h"
#import "UIImageView+AFNetworking.h"
#import "AIPhoto.h"
@implementation AIStatusPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentMode:(UIViewContentModeScaleAspectFill)];
        [self setClipsToBounds:YES];
    }
    return self;
}

-(void)setPhoto:(AIPhoto *)photo{
    //下载图片    
    [self setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
}
@end
