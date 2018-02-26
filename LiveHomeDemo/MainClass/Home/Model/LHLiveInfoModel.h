//
//  LHLiveInfoModel.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/7.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 public string id { get; set; }
 public string name { get; set; }
 public string image { get; set; }
 public string url { get; set; }
 /// <summary>
 /// 浏览量
 /// </summary>
 public int count { get; set; }
 /// <summary>
 /// 是否可以加载视频
 /// </summary>
 public bool isshow { get; set; }
 /// <summary>
 /// 模版编号
 /// </summary>
 public string template { get; set; }
 /// <summary>
 /// 直播间的编号，聊天室的编号,可用于聊天和获取直播间信息
 /// </summary>
 public string roomid { get; set; }
 /// <summary>
 /// 当前视频的APP用户编号，可用于调用历史视频接口
 /// </summary>
 public string userid { get; set; }
 /// <summary>
 /// 标题
 /// </summary>
 public string share_title { get; set; }
 
 /// <summary>
 /// 图片
 /// </summary>
 public string share_img { get; set; }
 
 /// <summary>
 /// 描述
 /// </summary>
 public string share_dec { get; set; }
 
 /// <summary>
 /// 地址
 /// </summary>
 public string share_url { get; set; }

 */
@interface LHLiveInfoModel : NSObject
/** 模版标题 */
@property (nonatomic, copy) NSString *name;
/** 图片 */
@property (nonatomic, copy) NSString *image;
/** 主id */
@property (nonatomic, copy) NSString *pid;
/** 视频地址 */
@property (nonatomic, copy) NSString *url;
/** 创建时间 */
@property (nonatomic, copy) NSString *time;
/** 二维码地址 */
@property (nonatomic, copy) NSString *qrcode;
/** 浏览量 */
@property (nonatomic, assign) int count;
/** 视频宽 */
@property (nonatomic, copy) NSString *w;
/** 视频高 */
@property (nonatomic, copy) NSString *h;
/** 是否可以加载视频 */
@property (nonatomic, assign) BOOL isshow;
/** 直播间的编号，聊天室的编号,可用于聊天和获取直播间信息 */
@property (nonatomic, copy) NSString *roomid;
/** 直播间no*/
@property (nonatomic, copy) NSString *roomno;
/** 当前视频的APP用户编号，可用于调用历史视频接口 */
@property (nonatomic, copy) NSString *userid;
/** 模版编号 */
@property (nonatomic, copy) NSString *kTemplate;
/** 分享标题 */
@property (nonatomic, copy) NSString *share_title;
/** 分享图片 */
@property (nonatomic, copy) NSString *share_img;
/** 分享描述 */
@property (nonatomic, copy) NSString *share_dec;
/** 分享地址 */
@property (nonatomic, copy) NSString *share_url;
/** 是否需要签到 */
@property (nonatomic, assign) BOOL sign;
/** 是否显示签到输入框 */
@property (nonatomic, assign) BOOL needshowinfo;
/** 是否需要传递用户信息 */
@property (nonatomic, assign) BOOL needuserinfo;
/** 是否有密码 */
@property (nonatomic, assign) BOOL haspwd;
//自己创建的
/** 图片下载后的地址 */
@property (nonatomic, strong) NSData *imageData;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
