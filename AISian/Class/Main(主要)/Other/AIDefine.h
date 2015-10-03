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