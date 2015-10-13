//
//  AIStatusFrame.h
//  AISian
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIStatusDetailFrame,AIStatusToolbarFrame,AIStatusesModel;
@interface AIStatusFrame : NSObject
/**
 *  微博内容frame
 */
@property(nonatomic,strong)AIStatusDetailFrame *detailFrame;
/**
 *  微博工具栏frame
 */
@property(nonatomic,strong)AIStatusToolbarFrame *toolbarFrame;
/**
 *  微博内容模型
 */
@property(nonatomic,strong)AIStatusesModel *statusesModel;
@end
