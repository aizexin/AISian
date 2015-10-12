//
//  AIHttpTool.m
//  AISian
//
//  Created by qianfeng on 15/10/11.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//处理所有关于网络请求的问题

#import "AIHttpTool.h"
#import "AFHTTPRequestOperationManager.h"
@implementation AIHttpTool

+(void)get:(NSString*)path params:(NSDictionary*)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)post:(NSString*)path params:(NSDictionary*)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


//AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//NSMutableDictionary *params = [NSMutableDictionary dictionary];
//AIAccountModel *account = [AIAccountTool account];
//params[@"access_token"] = account.access_token;
//params[@"status"] = self.textView.text;
//[manager POST:Compose_Path_Image parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    AILog(@"---发送请求成功");
//} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    AILog(@"---发送请求失败,%@",error.description);
//}];

+(void)postPath:(NSString*)path params:(NSDictionary*)params forData:(void (^)(id forData))data success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (data) {
            data(formData);
        }
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
