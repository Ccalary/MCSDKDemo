//
//  LHVideoViewController.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHLiveInfoModel.h"
@protocol LHVideoVCDelegate<NSObject>
- (void)clickVideoWithModel:(LHLiveInfoModel *)model;
@end
@interface LHVideoViewController : UIViewController
@property (nonatomic, weak) id<LHVideoVCDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame infoId:(NSString *)infoId;
@end
