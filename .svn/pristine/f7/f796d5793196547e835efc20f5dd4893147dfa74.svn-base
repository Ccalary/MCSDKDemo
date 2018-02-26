//
//  LHTemplateModel.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/7.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHTemplateModel.h"

@implementation LHTemplateModel
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
    }else if ([key isEqualToString:@"template"]){
        key = @"kTemplate";
    }else if ([key isEqualToString:@"tabs"]){
        NSMutableArray *array = [NSMutableArray array];
        for (int i=0; i<((NSArray *)value).count; i++) {
            NSDictionary *dic = ((NSArray *)value)[i];
            LHTemplateTabModel *model = [[LHTemplateTabModel alloc] initWithDictionary:dic];
            [array addObject:model];
        }

        //注意这个地方不能用变量名_tabs,一定要用value,不然转后的模型则没有赋值进去
        value = array;
    }
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"value:%@,undefineKey:%@",value,key);
}
@end
