//
//  AIAccountTool.h
//  AISian
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIAccountModel;

@interface AIAccountTool : NSObject

+(void)save:(AIAccountModel*)account;
+(AIAccountModel *)account;

@end
