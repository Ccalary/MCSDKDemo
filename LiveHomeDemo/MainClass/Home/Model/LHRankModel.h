//
//  LHRankModel.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface LHRankModel : NSObject
/** 序号 */
@property (nonatomic, assign) int index;
/** 用户编号 */
@property (nonatomic, copy) NSString *pid;
/** 用户昵称 */
@property (nonatomic, copy) NSString *name;
/** 用户头像 */
@property (nonatomic, copy) NSString *image;
/** 分享次数 */
@property (nonatomic, assign) int count;
//自己创建的
/** 图片下载后的地址 */
@property (nonatomic, strong) NSData *imageData;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
