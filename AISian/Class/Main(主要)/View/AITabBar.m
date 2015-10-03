//
//  AITabBar.m
//  AISian
//
//  Created by 艾泽鑫 on 15/10/3.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "AITabBar.h"
#import "AIDefine.h"
#import "UIView+Extension.h"
@implementation AITabBar

-(void)layoutSubviews{
    [super layoutSubviews];
    [self setTabBarItemFrame];
}

-(void)setTabBarItemFrame{
    AILog(@"%ld",self.items.count);
    CGFloat width = self.width / 5;
    CGFloat hight = self.height;
    int index = 0;
    for (UIView *tabBarItem in self.subviews) {
        if (![tabBarItem isKindOfClass:[NSClassFromString(@"UITabBarButton") class]]) {
            continue;
        }

        CGFloat itemW = width;
        CGFloat itemH = hight;
        CGFloat itemY = 0;
        CGFloat itemX = itemW * index;
        if (index >= 2) {
            itemX += width;
        }
        tabBarItem.frame = CGRectMake(itemX, itemY, itemW, itemH);
        index ++;
    }

}
@end
