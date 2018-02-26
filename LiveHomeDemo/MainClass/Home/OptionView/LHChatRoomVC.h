//
//  LHChatRoomVC.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTemplateTabModel.h"
#import "LHLiveInfoModel.h"
@interface LHChatRoomVC : UIViewController
- (instancetype)initWithFrame:(CGRect)frame infoModel:(LHLiveInfoModel *)infoModel tabModel:(LHTemplateTabModel *)tabModel;
@end
