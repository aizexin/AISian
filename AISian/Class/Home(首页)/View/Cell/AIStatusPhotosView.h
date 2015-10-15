//
//  AIStatusPhotosView.h
//  AISian
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//  微博里面的相册 里面有很多StatusPhotoView

#import <UIKit/UIKit.h>

@class AIStatusesModel;
@interface AIStatusPhotosView : UIView

/**
 *  微博数据模型
 */
@property(nonatomic,strong)AIStatusesModel *statusesModel;

+(CGSize)sizeWithPhotosCount:(NSInteger)photosCount;

@end
