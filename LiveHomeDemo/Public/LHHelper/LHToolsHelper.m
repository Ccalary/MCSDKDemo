//
//  LHToolsHelper.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/1.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHToolsHelper.h"

@implementation LHToolsHelper
+ (UIImage *)getImageWithName:(NSString *)name{
    //从mainbundle中获取resources.bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LHResource" ofType:@"bundle"];
    // 找到对应images夹下的图片
    NSString *str = [[path stringByAppendingPathComponent:@"images"] stringByAppendingPathComponent:name];
    //生成图片
    UIImage *image = [UIImage imageWithContentsOfFile:str];
    return image;
}

//字典转Json字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/** json转字典 */
+ (NSDictionary *)dictionaryFromJson:(NSString *)jsonString
{
    if([jsonString isKindOfClass:[NSDictionary class]])
        return (NSDictionary *)jsonString;
    if([jsonString isKindOfClass:[NSMutableDictionary class]])
        return (NSDictionary *)jsonString;
    
    NSDictionary* dict;
    if (jsonString && ![jsonString isKindOfClass:[NSNull class]] && ![jsonString isEqualToString:@""]) {
        NSError * parseError = nil;
        dict = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&parseError];
    }
    return dict;
}

/** 处理字典中value为空的情况 */
+ (NSMutableDictionary *)dictionaryDealNull:(NSDictionary *)dic{
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithDictionary:dic];
    for (NSString *key in [mDic allKeys]){
        if (!mDic[key] || [mDic[key] isEqual:[NSNull null]]){
            mDic[key] = @"";
        }
    }
    return mDic;
}

/**计算多行高度*/
+ (CGFloat )calculateStrHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.height;
}

/** 秒数转换成时间 */
+ (NSString *)getMMSSFromSS:(NSString *)totalTime{
    NSInteger seconds = [totalTime integerValue];
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}
@end
