//
//  AIStatusRetweetedFrame.h
//  AISian
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class AIStatusesModel;
@interface AIStatusRetweetedFrame : NSObject
/**
 *  微博数据模型
 */
@property(nonatomic,strong)AIStatusesModel *statusesModel;
/** 昵称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;

/** 自己的frame */
@property (nonatomic, assign) CGRect frame;
@end
