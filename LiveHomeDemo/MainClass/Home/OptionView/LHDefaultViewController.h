//
//  LHDefaultViewController.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTemplateTabModel.h"
@protocol LHDefaultVCDelegate<NSObject>
- (void)enterToWebViewWithTitle:(NSString *)title url:(NSString *)url;
@end

@interface LHDefaultViewController : UIViewController
@property (nonatomic, weak) id<LHDefaultVCDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame model:(LHTemplateTabModel *)model;
@end
