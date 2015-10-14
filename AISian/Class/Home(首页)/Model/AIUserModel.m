//
//  AIUserModel.m
//  AISian
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIUserModel.h"

@implementation AIUserModel

-(BOOL)isVip{
    NSLog(@"%d",self.mbtype);
    return self.mbtype > 2;
}
@end
