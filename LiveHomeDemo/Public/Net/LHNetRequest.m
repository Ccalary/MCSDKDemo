//
//  LHNetRequest.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/2.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHNetRequest.h"

#define BASE_URL            @"http://livesdkapi.o2o.com.cn/"
#define AnonymousLogin      BASE_URL@"Account/SDKAnonymousUser" //匿名登录
#define SDKLogin            BASE_URL@"Account/SDKLogin" //三方登录
#define LiveInfo            BASE_URL@"Live/Info"       //直播信息接口
#define VideoInfo           BASE_URL@"Video/Info"      //历史视频详情接口
#define TemplateInfo        BASE_URL@"Template/Info"   //模版信息接口
#define VideoList           BASE_URL@"Video/List"      //视频列表
#define VoteInfo            BASE_URL@"Vote/Info"       //投票活动信息
#define VoteVote            BASE_URL@"Vote/Vote"       //投票
#define LiveShareBangdan    BASE_URL@"Live/ShareBangdan" //分享主播榜单
#define VideoShareBangdan   BASE_URL@"Video/ShareBangdan" //分享录像榜单
#define LiveShareZhubo      BASE_URL@"Live/ShareZhubo"   //分享主播
#define VideoShareVideo     BASE_URL@"Video/ShareVideo"  //分享录像
#define LiveSign            BASE_URL@"Live/Sign"         //签到
#define LiveCheckRoomPwd    BASE_URL@"Live/CheckRoomPwd"  //检查房间密码
@implementation LHNetRequest
/** 匿名登录 */
+ (void)postAnonymousLoginWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:AnonymousLogin parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 三方登录 */
+ (void)postSDKLoginWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:SDKLogin parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 直播信息 */
+ (void)postLiveInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:LiveInfo parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 历史视频详情接口 */
+ (void)postVideoInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:VideoInfo parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


/** 模版信息 */
+ (void)postTemplateInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:TemplateInfo parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 视频列表 */
+ (void)postVideoListWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:VideoList parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 投票活动信息 */
+ (void)postVoteInfoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:VoteInfo parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 投票 */
+ (void)postVoteVoteWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:VoteVote parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 分享主播榜单 */
+ (void)postLiveShareBangdanWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:LiveShareBangdan parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 分享录像榜单 */
+ (void)postVideoShareBangdanWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:VideoShareBangdan parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 分享主播 */
+ (void)postLiveShareZhuboWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:LiveShareZhubo parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 分享录像 */
+ (void)postVideoShareVideoWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:VideoShareVideo parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 签到 */
+ (void)postLiveSignWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:LiveSign parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/** 检查密码 */
+ (void)postLiveCheckRoomPwdWithParams:(NSMutableDictionary *)params success:(void (^)(id response))success failure:(void (^)(NSError *error))failure{
    
    [[LHNetConnect sharedInstance] postWithUrl:LiveCheckRoomPwd parameters:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
