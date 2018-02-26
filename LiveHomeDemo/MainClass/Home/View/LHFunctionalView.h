//
//  LHFunctionalView.h
//  LiveHomeDemo
//
//  Created by nie on 2017/12/5.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTemplateTabModel.h"

@interface LHFunctionalView : UIView
- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray qrcode:(NSString *)qrcode tabModel:(LHTemplateTabModel *)tabModel;
@end
