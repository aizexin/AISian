//
//  AIAccountTool.m
//  AISian
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIAccountTool.h"
#define PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"account"]

@implementation AIAccountTool

+(void)save:(AIAccountModel*)account{
    //归档
    [NSKeyedArchiver archiveRootObject:account toFile:PATH];
}

+(AIAccountModel *)account{
    //接档
    AIAccountModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH];
#warning  判断是否过期
//    NSDate *now = [NSDate date];
    return account;
}

@end
