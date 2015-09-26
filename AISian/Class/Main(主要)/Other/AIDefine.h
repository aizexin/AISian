//
//  AIDefine.h
//  AIweichat
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#ifndef AIweichat_AIDefine_h
#define AIweichat_AIDefine_h

#define AILog(...) NSLog(__VA_ARGS__)
#define Mainsize ([[UIScreen mainScreen]bounds].size)
// 随机色
#define AIRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
// 是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#endif
