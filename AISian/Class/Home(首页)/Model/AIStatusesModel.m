//
//  AIStatusesModel.m
//  AISian
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIStatusesModel.h"
#import "MJExtension.h"
#import "AIPhoto.h"
@implementation AIStatusesModel

- (NSDictionary *)objectClassInArray
{
    return @{@"pic_urls" : [AIPhoto class]};
}
@end
