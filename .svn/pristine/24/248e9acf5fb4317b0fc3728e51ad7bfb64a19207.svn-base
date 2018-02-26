//
//  LHVoteModel.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 content = "选择项";
 count = 0;
 id = 1;
 image = "";
 vote = 0;
 */
@interface LHVoteModel : NSObject
/** 选项名称 */
@property (nonatomic, copy) NSString *content;
/** 投票数量 */
@property (nonatomic, assign) int count;
/** 选项id */
@property (nonatomic, copy) NSString *pid;
/** 图片 */
@property (nonatomic, copy) NSString *image;
/** 是否投票 */
@property (nonatomic, assign) BOOL vote;
//自己创建的
/** 图片下载后的地址 */
@property (nonatomic, strong) NSData *imageData;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
