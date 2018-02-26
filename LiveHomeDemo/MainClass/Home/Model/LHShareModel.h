//
//  LHShareModel.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/9.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHShareModel : NSObject
/** 分享标题 */
@property (nonatomic, copy) NSString *share_title;
/** 分享图片 */
@property (nonatomic, copy) NSString *share_img;
/** 分享描述 */
@property (nonatomic, copy) NSString *share_dec;
/** 分享地址 */
@property (nonatomic, copy) NSString *share_url;
@end
