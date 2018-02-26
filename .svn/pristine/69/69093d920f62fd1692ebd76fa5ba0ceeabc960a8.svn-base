//
//  LHLogoView.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/9.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTemplateModel.h"
@protocol LHLogoViewDelegate<NSObject>
- (void)logoBtnClickWithUrl:(NSString *)url;
@end
@interface LHLogoView : UIView
@property (nonatomic, weak) id<LHLogoViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame andModel:(LHTemplateModel *)model;
@end
