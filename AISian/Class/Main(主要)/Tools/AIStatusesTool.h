//
//  AIStatusesTool.h
//  AISian
//
//  Created by 艾泽鑫 on 15/10/12.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIHomeStatusesParamModel.h"
#import "AIHomeStatusesResultModel.h"
@interface AIStatusesTool : NSObject
//[AIStatusesTool homeStatusesWithParams:(参数模型) success:(返回一个结果模型) failure:(void (^)(NSError *error))];
+(void)homeStatusesWithParams:(AIHomeStatusesParamModel *)paramModel success:(void (^)(AIHomeStatusesResultModel* resultModel))success failure:(void (^)(NSError *error))failure;
@end
