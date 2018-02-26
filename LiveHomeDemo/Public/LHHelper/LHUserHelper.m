//
//  LHUserHelper.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/4.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHUserHelper.h"
#import "LHToolsHelper.h"

static NSString *const kLiveHomeAppId = @"kLiveHomeAppId"; //智播家的appid
static NSString *const kIsLogin = @"LH_IsLogin";//登录
static NSString *const kAuth = @"LH_Auth";      //auth
static NSString *const kUserId = @"LH_UserId";  //id
static NSString *const kUserName = @"LH_UserName";  //name
static NSString *const kRongCloudToken = @"LH_RongCloudToken";//融云token
static NSString *const kLiveKeyWords = @"LHLiveKeyWords";//关键字过滤
static NSString *const kVideoType = @"LHVideoType"; //视频种类
static NSString *const kPlayId = @"LHPlayId"; //当前视频的id

@implementation LHUserHelper

/** 保存AppId */
+ (void)setLiveHomeAppId:(NSString *)appId{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:appId forKey:kLiveHomeAppId];
    [defaults synchronize];
}

/** 获取AppId */
+ (NSString *)getLiveHomeAppId{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *appId = [defaults objectForKey:kLiveHomeAppId];
    return appId;
}

//是否实名登录
+(BOOL)isRealLogin{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:kIsLogin];
    return [login isEqualToString:@"1"];
}

//是否匿名登录
+(BOOL)isVistorLogin{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:kIsLogin];
    return [login isEqualToString:@"0"];
}

//保存登录信息(0-匿名登录 1-实名登录)
+(void)setLogInfo:(NSDictionary *)dic withReal:(int)real{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSString stringWithFormat:@"%d",real] forKey:kIsLogin];//登录
    [defaults setObject:[dic objectForKey:@"auth"] forKey:kAuth];//auth
    [defaults setObject:[dic objectForKey:@"id"] forKey:kUserId];//id
    [defaults setObject:[dic objectForKey:@"t"] forKey:kRongCloudToken];//融云token
    [defaults synchronize];
}

//退出
+(void)logout{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"" forKey:kIsLogin];
    [defaults setObject:@""  forKey:kAuth];
    [defaults setObject:@""  forKey:kUserId];
    [defaults setObject:@""  forKey:kRongCloudToken];
    [defaults synchronize];
}

/** 获得auth */
+ (NSString *)getMemberAuth{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *auth = [defaults objectForKey:kAuth];
    return auth;
}

/** 获得userId*/
+ (NSString *)getUserId{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [defaults objectForKey:kUserId];
    return userId;
}

/** 获得userName*/
+ (NSString *)getUserName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [defaults objectForKey:kUserName];
    return userId;
}

/** 存储userName */
+ (void)setUserName:(NSString *)userName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName forKey:kUserName];
    [defaults synchronize];
}

/** 获得融云Token */
+ (NSString *)getRongCloudToken{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [defaults objectForKey:kRongCloudToken];
    return token;
}

/** 保存敏感词 */
+(void)setLiveKeyWords:(NSArray *)array{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:array forKey:kLiveKeyWords];
    [defaults synchronize];
}

/** 获取敏感词 */
+ (NSArray *)getLiveKeyWords{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults objectForKey:kLiveKeyWords];
    return array;
}

/** 保存播放种类 0-直播 1-历史视频 */
+(void)setVideoType:(NSInteger)type{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:type forKey:kVideoType];
    [defaults synchronize];
}

/** 获取播放种类 0-直播 1-历史视频*/
+ (NSInteger)getVideoType{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger type = [defaults integerForKey:kVideoType];
    return type;
}

/** 获得视频id*/
+ (NSString *)getPlayId{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *playId = [defaults objectForKey:kPlayId];
    return playId;
}

/** 存储视频id */
+ (void)setPlayId:(NSString *)playId{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:playId forKey:kPlayId];
    [defaults synchronize];
}

@end
