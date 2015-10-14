//
//  AIStatusRetweetedView.m
//  AISian
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIStatusRetweetedView.h"
#import "AIDefine.h"
#import "AIStatusRetweetedFrame.h"
#import "AIStatusesModel.h"
#import "AIUserModel.h"
#import "UIImage+Extension.h"
@interface AIStatusRetweetedView ()
/**  昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 正文 */
@property (nonatomic, weak) UILabel *textLabel;
@end
@implementation AIStatusRetweetedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景
        self.image = [UIImage resizedImage:@"timeline_retweet_background"];
        
        //设置昵称
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.textColor = AIColor(74, 102, 10);
        nameLabel.font = AIStatusRetweetedNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //设置正文
        UILabel *textLabel = [[UILabel alloc]init];
        textLabel.font = AIStatusRetweetedTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
    }
    return self;
}

-(void)setRetweetedFrame:(AIStatusRetweetedFrame *)retweetedFrame{
    _retweetedFrame = retweetedFrame;
    self.frame = retweetedFrame.frame;
    
    //取出微博数据
    AIStatusesModel *statuses = retweetedFrame.statusesModel;
    //设置昵称
//    self.nameLabel.text = statuses.user.name;
    self.nameLabel.text = [NSString stringWithFormat:@"@%@",statuses.user.name];
    self.nameLabel.frame = retweetedFrame.nameFrame;
    //设置内容
    self.textLabel.text = statuses.retweeted_status.text;
    self.textLabel.frame = retweetedFrame.textFrame;

}

//-(void)drawRect:(CGRect)rect{
////    [[UIImage resizedImage:@"tabbar_compose_button"]drawInRect:rect];
//}
@end
