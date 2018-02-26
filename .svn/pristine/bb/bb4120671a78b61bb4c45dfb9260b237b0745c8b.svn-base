//
//  LHRankModel.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHRankModel.h"

@implementation LHRankModel
- (instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    //在这里更改key
    if([key isEqualToString:@"id"]){
        key = @"pid";
    }
    [super setValue:value forKey:key];
}
//冗错处理，如果有未定义的字段的话就会走到这里，不重写的话会引起崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"value:%@,undefineKey:%@",value,key);
}
@end
