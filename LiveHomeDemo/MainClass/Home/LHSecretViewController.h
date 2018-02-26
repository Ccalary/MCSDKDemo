//
//  LHSecretViewController.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/29.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^successBlock)(void);
typedef void(^cancelBlock)(void);
@interface LHSecretViewController : UIViewController
@property (nonatomic, copy) successBlock successBlock;
@property (nonatomic, copy) cancelBlock cancelBlock;
@property (nonatomic, copy) NSString *roomId;
@end
