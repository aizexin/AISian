//
//  UIBarButtonItem+Extension.m
//  AISian
//
//  Created by 艾泽鑫 on 15/9/28.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem(Extension)
+(UIBarButtonItem*)itemWithTagert:(id)tagert action:(SEL)sel NorImageName:(NSString*)norImageName andHeiImageName:(NSString*)higImageName{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:[UIImage imageNamed:norImageName] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:higImageName] forState:(UIControlStateHighlighted)];
    [btn addTarget:tagert action:sel forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
}
@end
