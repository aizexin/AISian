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
@property(nonatomic ,assign)NSNumber *mbrank;
@property(nonatomic ,assign)NSNumber *mbtype;
@property(nonatomic ,copy)NSString *name;
@property(nonatomic ,copy)NSString *profile_image_url;
@end
