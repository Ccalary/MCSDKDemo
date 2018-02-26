//
//  LHMainViewController.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/1.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHShareModel.h"
//加载视频类型
typedef NS_ENUM(NSInteger, LHPlayVideoType){
    LHPlayVideoTypeLive  = 0 , //直播
    LHPlayVideoTypeVideo = 1 , //历史视频
};

@interface LHMainViewController : UIViewController
/**
 初始化视频信息
 
 @param type 播放视频种类
 @param playId 寻见获取到的playId
 */
- (instancetype)initWithPlayVideoType:(LHPlayVideoType)type playId:(NSString *)playId;


/**
 分享按钮点击
 @param model 分享的model
 */
- (void)lhShareWithModel:(LHShareModel *)model;
@end
