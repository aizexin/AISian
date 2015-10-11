//
//  AIUserModel.h
//  AISian
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIUserModel : NSObject
@property(nonatomic ,copy)NSString *idstr;
/**
 *  向好友显示的名称
 */
@property(nonatomic ,copy)NSString *name;
/**
 *  头像缩略图
 */
@property(nonatomic ,copy)NSString *profile_image_url;
@end
