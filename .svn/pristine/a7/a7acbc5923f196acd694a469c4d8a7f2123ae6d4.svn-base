//
//  LHSignPopView.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/29.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^signBlock)(void);
@interface LHSignPopView : UIView
@property (nonatomic, copy) signBlock block;
@property (nonatomic, assign) BOOL needUserInfo;//是否需要个人填写信息
@property (nonatomic, strong) NSString *roomId;//主播间编号

- (instancetype)initWithFrame:(CGRect)frame needShowInfo:(BOOL)needShow;
@end
