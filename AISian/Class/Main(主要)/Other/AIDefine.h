//
//  AIDefine.h
//  AIweichat
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#ifndef AIweichat_AIDefine_h
#define AIweichat_AIDefine_h

#import "UIView+Extension.h"
#import "UIImage+Extension.h"
#import "NSString+Extension.h"
#define Mainsize ([[UIScreen mainScreen]bounds].size)
// 颜色
#define AIColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define AIRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
// 是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
// 导航栏标题的字体
#define AINavigationTitleFont [UIFont boldSystemFontOfSize:20]
// 是否为4inch
#define FourInch ([UIScreen mainScreen].bounds.size.height == 568.0)
#endif

#ifdef DEBUG//调试阶段的log
#define AILog(...) NSLog(__VA_ARGS__)
#else
#define AILog(...)
#endif
//应用信息
#define AIAppKey @"568335106"
#define AIAppSecrect @"a41299f2678ae4aee937d6bdc7ecc257"
#define AIAppRediectURI @"http://www.baidu.com"


// cell的计算参数
// cell之间的间距
#define AIStatusCellMargin 10
// cell的内边距
#define AIStatusCellInset 10
// 原创微博昵称字体
#define AIStatusOrginalNameFont [UIFont systemFontOfSize:14]
// 原创微博时间字体
#define AIStatusOrginalTimeFont [UIFont systemFontOfSize:12]
// 原创微博来源字体
#define AIStatusOrginalSourceFont AIStatusOrginalTimeFont
// 原创微博正文字体
#define AIStatusOrginalTextFont [UIFont systemFontOfSize:15]

// 转发微博昵称字体
#define AIStatusRetweetedNameFont AIStatusOrginalNameFont
// 转发微博正文字体
#define AIStatusRetweetedTextFont AIStatusOrginalTextFont


