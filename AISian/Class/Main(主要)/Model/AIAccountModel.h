//
//  AIAccountModel.h
//  AISian
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIAccountModel : NSObject<NSCoding>
/**
 * 	用于调用access_token，接口获取授权后的access token。
 */
@property(nonatomic ,copy)NSString *access_token;
/**
 *access_token的生命周期，单位是秒数。
 */
@property(nonatomic ,copy)NSString *expires_in;
/**
 * 当前授权用户的UID。
 */
@property(nonatomic ,copy)NSString *uid;
/**
 *  判断是否过期
 */
@property(nonatomic, assign,getter=isOverdue)BOOL overdue;
+(instancetype)accountWithDict:(NSDictionary*)dict;
@end
