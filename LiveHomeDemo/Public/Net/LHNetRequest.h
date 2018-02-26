//
//  LHNetRequest.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/2.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHNetConnect.h"
@interface LHNetRequest : NSObject
/** 匿名登录 */
+ (void)postAnonymousLoginWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 三方登录 */
+ (void)postSDKLoginWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 直播信息 */
+ (void)postLiveInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 历史视频详情接口 */
+ (void)postVideoInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 模版信息 */
+ (void)postTemplateInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 视频列表 */
+ (void)postVideoListWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 投票活动信息 */
+ (void)postVoteInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 投票 */
+ (void)postVoteVoteWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 分享主播榜单 */
+ (void)postLiveShareBangdanWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 分享录像榜单 */
+ (void)postVideoShareBangdanWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 分享主播 */
+ (void)postLiveShareZhuboWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 分享录像 */
+ (void)postVideoShareVideoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 签到 */
+ (void)postLiveSignWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

/** 检查密码 */
+ (void)postLiveCheckRoomPwdWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;
@end
