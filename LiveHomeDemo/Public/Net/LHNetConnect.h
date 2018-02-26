//
//  LHNetConnect.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/12.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHNetConnect : NSObject
/** 单列初始化 */
+ (LHNetConnect *)sharedInstance;

/**
 post请求
 @param url 接口地址
 @param parameters 参数
 @param success 成功
 @param failure 失败
 */
- (void)postWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;
@end
