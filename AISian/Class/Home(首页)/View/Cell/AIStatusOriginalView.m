//
//  AIStatusOrginalView.m
//  AISian
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIStatusOriginalView.h"
#import "AIDefine.h"
#import "AIStatusesModel.h"
#import "AIStatusOriginalFrame.h"
#import "AIUserModel.h"
#import "UIImageView+AFNetworking.h"
@interface AIStatusOriginalView ()
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 正文 */
@property (nonatomic, weak) UILabel *textcontentLabel;
/** 来源 */
@property (nonatomic, weak) UILabel *sourceLabel;
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;
/** 头像 */
@property (nonatomic, weak) UIImageView *iconView;
@end

@implementation AIStatusOriginalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = AIStatusOrginalNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 2.正文（内容）
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.font = AIStatusOrginalTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textcontentLabel = textLabel;
        
        // 3.时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = AIStatusOrginalTimeFont;
        [timeLabel setBackgroundColor:[UIColor yellowColor]];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        // 4.来源
        UILabel *sourceLabel = [[UILabel alloc] init];
        sourceLabel.font = AIStatusOrginalSourceFont;
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
        // 5.头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
    }
    return self;
}
-(void)setOriginalFrame:(AIStatusOriginalFrame *)originalFrame{
    _originalFrame = originalFrame;
    AIStatusesModel *statuses = originalFrame.status;
    AIUserModel *user = statuses.user;
    //名称
    self.nameLabel.text = user.name;
    self.nameLabel.frame = originalFrame.nameFrame;
    //正文内容
    self.textcontentLabel.text = statuses.text;
    self.textcontentLabel.frame = originalFrame.textFrame;
    //时间
    self.timeLabel.text = statuses.created_at;
    self.timeLabel.frame = originalFrame.timeFrame;
    //来源
    self.sourceLabel.text = statuses.source;
    self.sourceLabel.frame = originalFrame.sourceFrame;
    //头像
    NSURL *iconUrl = [NSURL URLWithString:user.profile_image_url];
    [self.iconView setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    self.iconView.frame = originalFrame.iconFrame;
    
}

@end
