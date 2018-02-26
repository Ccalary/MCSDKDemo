//
//  LHTemplateTabModel.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/7.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHTemplateTabModel.h"

@implementation LHTemplateTabModel
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"value:%@,undefineKey:%@",value,key);
}
@end
