//
//  LHQRCodeView.h
//  LiveHomeDemo
//
//  Created by nie on 2017/12/5.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTemplateTabModel.h"
@interface LHQRCodeView : UIView
- (instancetype)initWithFrame:(CGRect)frame andModel:(LHTemplateTabModel *)model;
- (instancetype)initWithFrame:(CGRect)frame andQrcode:(NSString *)qrcode;
@end
