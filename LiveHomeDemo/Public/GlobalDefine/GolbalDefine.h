//
//  GolbalDefine.h
//  LiveHomeSDK
//
//  Created by chh on 2017/12/1.
//  Copyright © 2017年 chh. All rights reserved.
//

#ifndef GolbalDefine_h
#define GolbalDefine_h
//共用的资源头文件引入
#import "LHToolsHelper.h"
#import "UIColor+LHExtension.h"

//大小尺寸（宽、高）
#define LH_ScreenWidth                     [[UIScreen mainScreen] bounds].size.width
#define LH_ScreenHeight                    [[UIScreen mainScreen] bounds].size.height

//statusBar高度
#define LH_StatusBarHeight                 [UIApplication sharedApplication].statusBarFrame.size.height
//navBar高度
#define LH_NavigationBarHeight             [[UINavigationController alloc] init].navigationBar.frame.size.height
//TabBar高度  iPhoneX 高度为83
#define LH_TabBarHeight                    ((LH_StatusBarHeight > 20.0f) ? 83.0f : 49.0f)
//nav顶部高度
#define LH_TopFullHeight                   (LH_StatusBarHeight + LH_NavigationBarHeight)

//font
#define LH_Font_System(x)                    [UIFont systemFontOfSize:x]
#define LH_Font_System_Bold(x)               [UIFont boldSystemFontOfSize:x]

//融云生产环境Appkey
#define RongIMAppKey_Pro                           @"e5t4ouvptxdja"

//通知 分享通知
#define Notification_Share                         @"Notification_Share"

#endif /* GolbalDefine_h */
