//
//  LHToolsHelper.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/1.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LHToolsHelper : NSObject
/**
 获取bundle中的图片
 @param name 图片名称(不用加后缀)
 @return 图片
 */
+ (UIImage *)getImageWithName:(NSString *)name;
//字典转Json字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
/** json转字典 */
+ (NSDictionary *)dictionaryFromJson:(NSString *)jsonString;

/** 处理字典中value为空的情况 */
+ (NSMutableDictionary *)dictionaryDealNull:(NSDictionary *)dic;

/**计算多行高度*/
+ (CGFloat )calculateStrHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width;

/** 秒数转换成时间 */
+ (NSString *)getMMSSFromSS:(NSString *)totalTime;
@end
