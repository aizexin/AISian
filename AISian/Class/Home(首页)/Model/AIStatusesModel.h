//
//  AIStatusesModel.h
//  AISian
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIUserModel;
@interface AIStatusesModel : NSObject
/**
 *  表态数
 */
@property(nonatomic,assign)NSNumber *attitudes_count;
/**
 *  评论数
 */
@property(nonatomic,assign)NSNumber *comments_count;
/**
 *  创建时间
 */
@property(nonatomic ,copy)NSString *created_at;
/**
 *  id
 */
@property(nonatomic ,copy)NSString *idstr;
/**
 *  图片组
 */
@property(nonatomic,strong)NSArray *pic_urls;
/**
 *  踩数
 */
@property(nonatomic ,assign)NSNumber *reposts_count;
/**
 *  来源
 */
@property(nonatomic ,copy)NSString *source;
/**
 *  内容
 */
@property(nonatomic ,copy)NSString *text;
/**
 *  用户
 */
@property(nonatomic,strong)AIUserModel *user;
@end
