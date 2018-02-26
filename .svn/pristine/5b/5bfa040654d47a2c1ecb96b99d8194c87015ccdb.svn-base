//
//  LHUserHelper.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/4.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHUserHelper : NSObject
/** 保存AppId */
+ (void)setLiveHomeAppId:(NSString *)appId;
/** 获取AppId */
+ (NSString *)getLiveHomeAppId;

//是否实名登录
+(BOOL)isRealLogin;
//是否匿名登录
+(BOOL)isVistorLogin;
//保存登录信息(0-匿名登录 1-实名登录)
+(void)setLogInfo:(NSDictionary *)dic withReal:(int)real;
//退出
+(void)logout;

/** 获得auth */
+ (NSString *)getMemberAuth;
/** 获得userId*/
+ (NSString *)getUserId;
/** 获得userName*/
+ (NSString *)getUserName;
/** 存储userName */
+ (void)setUserName:(NSString *)userName;
/** 获得融云Token */
+ (NSString *)getRongCloudToken;
/** 保存敏感词 */
+(void)setLiveKeyWords:(NSArray *)array;
/** 获取敏感词 */
+ (NSArray *)getLiveKeyWords;
/** 保存播放种类0-直播 1-历史视频 */
+(void)setVideoType:(NSInteger)type;
/** 获取播放种类0-直播 1-历史视频 */
+ (NSInteger)getVideoType;
/** 获得视频id*/
+ (NSString *)getPlayId;
/** 存储视频id */
+ (void)setPlayId:(NSString *)playId;
@end
