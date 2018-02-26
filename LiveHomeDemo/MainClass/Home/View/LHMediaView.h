//
//  LHMediaView.h
//  LiveHomeDemo
//
//  Created by 谢炳 on 2017/12/4.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHLiveInfoModel.h"
#import "LHTemplateModel.h"

@protocol LHMediaViewDelegate <NSObject>

- (void)switchScreenDirection:(UIButton *)sender;
- (void)closeBtnAction;

@end

@interface LHMediaView : UIView

/**
  初始化播放器view

 @param frame 布局
 @param model 数据模型
 @param tempModel 模版模型
 @param isLive 是否是直播
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame model:(LHLiveInfoModel *)model tempModel:(LHTemplateModel *)tempModel isLive:(BOOL)isLive;

//转换屏幕为横屏
- (void)changeScreenHorizonal:(BOOL )isHorizonal andFrame:(CGRect)frame;


@property (nonatomic, weak) id<LHMediaViewDelegate> delegate;

@property (nonatomic, assign) BOOL isPause; //暂停状态

@property (nonatomic, assign) BOOL isPlaying; //正在播放
/**开始播放*/
- (void)startPlay;
/**
 暂停播放
 */
- (void)pausePlay;
/**
 结束当前视频的播放。
 */
- (void)destroyPlay;

@end
