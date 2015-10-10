//
//  AIComposeToolbar.m
//  AISian
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIComposeToolbar.h"
#import "AIDefine.h"

@implementation AIComposeToolbar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background"]];
        [self addButtonWithNorImage:@"compose_camerabutton_background" higImage:@"compose_camerabutton_background_highlighted" andtag:AIComposeToolBarTagTypeCamera];
        [self addButtonWithNorImage:@"compose_toolbar_picture" higImage:@"compose_toolbar_picture_highlighted" andtag:AIComposeToolBarTagTypePicture];
        [self addButtonWithNorImage:@"compose_emoticonbutton_background" higImage:@"compose_emoticonbutton_background_highlighted" andtag:AIComposeToolBarTagTypeEmotion];
        [self addButtonWithNorImage:@"compose_mentionbutton_background" higImage:@"compose_mentionbutton_background_highlighted" andtag:AIComposeToolBarTagTypeMention];
        [self addButtonWithNorImage:@"compose_trendbutton_background" higImage:@"compose_trendbutton_background_highlighted" andtag:AIComposeToolBarTagTypeTrend];
    }
    return self;
}
-(void)addButtonWithNorImage:(NSString*)norImage higImage:(NSString*)higImage andtag:(AIComposeToolBarTagType)tag{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:[UIImage imageNamed:norImage] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:higImage] forState:(UIControlStateHighlighted)];
    [btn addTarget:self action:@selector(onClickBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.tag = tag;
    [self addSubview:btn];
}
-(void)layoutSubviews{
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        btn.y = 0;
        btn.width = self.width / 5;
        btn.height = self.height;
        btn.x = i * btn.width;
    }
}
#pragma mark -按钮点击事件
-(void)onClickBtn:(UIButton*)button{
    
    if ([self.delegate respondsToSelector:@selector(composeToolbar:didClick:)]) {
        [self.delegate composeToolbar:self didClick:button.tag];
    }
}

@end
