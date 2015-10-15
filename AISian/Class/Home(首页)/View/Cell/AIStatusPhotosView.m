//
//  AIStatusPhotosView.m
//  AISian
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIStatusPhotosView.h"

@implementation AIStatusPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];

    }
    return self;
}
+(CGSize)sizeWithPhotosCount:(NSInteger)photosCount{
    CGFloat photoW = 70;
    CGFloat photoH = photoW;
    CGFloat photoMargin = 10.0;
    
    // 一行最多几列
    int maxCols = 3;
    //总的列数
    NSInteger totalCols = photosCount > 3 ? photosCount/3 :1;
    
    //总的行数
    NSInteger totalRows = (photosCount + maxCols - 1)/maxCols;
    
    return CGSizeMake(totalCols * photoW, totalRows *photoH);
    
    
}
@end
