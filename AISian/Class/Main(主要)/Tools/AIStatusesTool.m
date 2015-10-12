//
//  AIStatusesTool.m
//  AISian
//
//  Created by 艾泽鑫 on 15/10/12.
//  Copyright © 2015年 aizexin. All rights reserved.
// 微博业务工具类 ：处理关于微博的一切业务，加载，什么的


#import "AIStatusesTool.h"
#import "AIHttpTool.h"
#import "MJExtension.h"

@implementation AIStatusesTool
+(void)homeStatusesWithParams:(AIHomeStatusesParamModel *)paramModel success:(void (^)(AIHomeStatusesResultModel* resultModel))success failure:(void (^)(NSError *error))failure{
    
    //模型转换为字典
     NSDictionary *params = paramModel.keyValues;
    NSLog(@"%@",params);
    [AIHttpTool get:@"https://api.weibo.com/2/statuses/home_timeline.json" params:params success:^(id responseObject) {
        if (success) {
            AIHomeStatusesResultModel *model = [AIHomeStatusesResultModel objectWithKeyValues:responseObject];
            success(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)userInfoStatusesWithParams:(AIUserInfoParamModel *)paramModel success:(void (^)(AIUserInfoResultModel * resultModel))success failure:(void (^)(NSError *error))failure{
    //模型转换为字典
    NSDictionary *params = paramModel.keyValues;
    NSLog(@"%@",params);
    [AIHttpTool get:@"https://api.weibo.com/2/users/show.json" params:params success:^(id responseObject) {
        if (success) {
            AIUserInfoResultModel *model = [AIUserInfoResultModel objectWithKeyValues:responseObject];
            success(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)composeStatusesWithParams:(AIComposeParamModel *)paramModel success:(void (^)(AIComposeResultModel * resultModel))success failure:(void (^)(NSError *error))failure{
    //模型转换为字典
    NSDictionary *params = paramModel.keyValues;
    NSLog(@"%@",params);
    [AIHttpTool post:@"https://api.weibo.com/2/statuses/update.json" params:params success:^(id responseObject) {
        if (success) {
            AIComposeResultModel *model = [AIComposeResultModel objectWithKeyValues:responseObject];
            success(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
//-(void)ss{
//    void(^block)(int a,int ) = ^(int a,int b ){
//        
//    };
//}
@end


