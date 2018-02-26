//
//  LHTemplateTabModel.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/7.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 [Display(Name = "标签页编号")]
 public string id { get; set; }
 [Display(Name = "标签页标题")]
 public string title { get; set; }
 [Display(Name = "标签页类型")]
 [FiliterEnum(EnumType = typeof(AppEnum.RoomTemplateTabType))]
 public int type { get; set; }
 public int sortid { get; set; }
 [Display(Name = "PC端显示客户二维码")]
 public bool pcshowpublic { get; set; } = true;
 [Display(Name = "PC端显示当前页面的二维码")]
 public bool pcshowurl { get; set; }
 [Display(Name = "手机端显示客户二维码")]
 public bool mobileshowpublic { get; set; }
 [Display(Name = "手机端显示当前页面的二维码")]
 public bool mobileshowurl { get; set; }
 [Display(Name = "客户二维码标题")]
 public string qrcodetitle { get; set; }
 [Display(Name = "客户的二维码")]
 public string qrcodeimage { get; set; }
 [Display(Name = "客户的二维码描述")]
 public string qrcodedescription { get; set; }
 /// <summary>
 /// 是否显示聊天表情
 /// </summary>
 public bool emoji { get; set; } = true;
 /// <summary>
 /// html编号
 /// </summary>
 public string htmlid { get; set; }
 /// <summary>
 /// html H5内容
 /// </summary>
 public string html { get; set; }
 /// <summary>
 /// 外部链接地址
 /// </summary>
 public string url { get; set; }
 [Display(Name = "历史视屏显示时间")]
 public bool showtime { get; set; } = true;
 [Display(Name = "历史视屏显示点击次数")]
 public bool showcount { get; set; } = true;

 */
@interface LHTemplateTabModel : NSObject
/** 标签页编号 */
@property (nonatomic, copy) NSString *pid;
/** 标签页标题 */
@property (nonatomic, copy) NSString *title;
/** 标签页类型 0-聊天 1-公告 2-视频 3-商城 4-投票 5-分享*/
@property (nonatomic, assign) int type;
/** Logo */
@property (nonatomic, copy) NSString *sortid;
/** PC端显示客户二维码 */
@property (nonatomic, assign) BOOL pcshowpublic;
/** PC端显示当前页面的二维码 */
@property (nonatomic, assign) BOOL pcshowurl;
/** 网页手机端显示客户二维码 */
@property (nonatomic, assign) BOOL mobileshowpublic;
/** 网页手机端显示当前页面的二维码 */
@property (nonatomic, assign) BOOL mobileshowurl;
/** app端显示客户二维码 */
@property (nonatomic, assign) BOOL appshowpublic;
/** app端显示当前页面的二维码 */
@property (nonatomic, assign) BOOL appshowurl;
/** 客户二维码标题 */
@property (nonatomic, copy) NSString *qrcodetitle;
/** 客户的二维码 */
@property (nonatomic, copy) NSString *qrcodeimage;
/** 客户的二维码描述 */
@property (nonatomic, copy) NSString *qrcodedescription;
/** 是否显示聊天表情 */
@property (nonatomic, assign) BOOL emoji;
/** html编号 */
@property (nonatomic, copy) NSString *htmlid;
/** html地址 */
@property (nonatomic, copy) NSString *html;
/** 外部链接地址 */
@property (nonatomic, copy) NSString *url;
/** 历史视屏显示时间 */
@property (nonatomic, assign) BOOL showtime;
/** 历史视屏显示点击次数 */
@property (nonatomic, assign) BOOL showcount;
/** 投票活动 */
@property (nonatomic, copy) NSString *voteid;
/** 投票活动显示类型 0-列表 1-网格 */
@property (nonatomic, assign) int votelisttype;
/** 榜单1*/
@property (nonatomic, copy) NSString *bd1;
/** 榜单2*/
@property (nonatomic, copy) NSString *bd2;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
