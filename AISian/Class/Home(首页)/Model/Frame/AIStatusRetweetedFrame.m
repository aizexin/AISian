//
//  AIStatusRetweetedFrame.m
//  AISian
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIStatusRetweetedFrame.h"
#import "AIStatusesModel.h"
#import "AIUserModel.h"
#import "AIDefine.h"
@implementation AIStatusRetweetedFrame


-(void)setStatusesModel:(AIStatusesModel *)statusesModel{
    _statusesModel = statusesModel;
    // 1.昵称
    CGFloat nameX = AIStatusCellInset;
    CGFloat nameY = AIStatusCellInset;
    CGSize nameSize = [statusesModel.user.name sizeWithFont:AIStatusRetweetedNameFont maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    // 2.正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(self.nameFrame) + AIStatusCellInset;
    CGFloat maxW = Mainsize.width - 2 * textX;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = [statusesModel.text sizeWithFont:AIStatusRetweetedNameFont maxSize:maxSize];
    self.textFrame = (CGRect){{textX, textY}, textSize};
    
    // 自己
    CGFloat x = 0;
    CGFloat y = 0; // 高度 = 原创微博最大的Y值
    CGFloat w = Mainsize.width;
    CGFloat h = CGRectGetMaxY(self.textFrame) + AIStatusCellInset;
    self.frame = CGRectMake(x, y, w, h);
}
@end
