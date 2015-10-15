//
//  AIStatusPhotosFrame.h
//  AISian
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AIStatusesModel;
@interface AIStatusPhotosFrame : NSObject

/**
 *  自己的frame
 */
@property(nonatomic,assign)CGRect frame;
/** 微博数据 */
@property (nonatomic, strong) AIStatusesModel *status;
@end
