//
//  AIStatusOriginalFrame.m
//  AISian
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIStatusOriginalFrame.h"
#import "AIDefine.h"
#import "AIUserModel.h"
#import "AIStatusesModel.h"
@implementation AIStatusOriginalFrame


-(void)setStatus:(AIStatusesModel *)status{
    
    _status = status;
    //1.设置头像
    CGFloat iconX = AIStatusCellInset;
    CGFloat iconY = AIStatusCellInset;
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //2.设置昵称
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + AIStatusCellInset;
    CGFloat nameY = iconY;
    
   CGSize nameSize = [status.user.name sizeWithFont:AIStatusOrginalNameFont maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
   
    self.nameFrame = (CGRect){{nameX,nameY},nameSize};
    
    //3.设置时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameFrame) + AIStatusCellInset;
    CGSize timeSize = [status.created_at sizeWithFont:AIStatusOrginalTimeFont maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
  
    self.textFrame = (CGRect){{timeX,timeY},timeSize};
    
    //4.设置来源
    CGFloat sourceX = CGRectGetMaxX(self.timeFrame) + AIStatusCellInset;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:AIStatusOrginalSourceFont maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    
    self.sourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
    
    //5.正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMinY(self.iconFrame) + AIStatusCellInset;
    CGSize textSize = [status.text sizeWithFont:AIStatusOrginalTextFont maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    self.textFrame = (CGRect){{textX,textY},textSize};
    
    //6.自己
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat W = Mainsize.width;
    CGFloat H = CGRectGetMaxY(self.textFrame);
    self.frame = CGRectMake(X, Y, W, H);
}
@end
