//
//  BaseWebViewController.h
//  LiveHome
//
//  Created by chh on 2017/11/22.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHBaseWebViewController : UIViewController

@property (nonatomic, assign) BOOL isCanGoBack;//是否网页有回退,默认YES
- (instancetype)initWithTitle:(NSString *)title url:(NSString *)url;
@end
