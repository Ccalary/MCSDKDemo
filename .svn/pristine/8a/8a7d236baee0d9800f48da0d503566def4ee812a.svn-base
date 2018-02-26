//
//  LHFunUtil.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/2.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHFunUtil.h"

@implementation LHFunUtil
+(BOOL)isNull:(id)o
{
    return o == nil || o == NULL || [o isKindOfClass:[NSNull class]];
}

+(BOOL)isBlankString:(id)o
{
    if([self isNull:o]) return YES;
    NSString *testString = [o copy];
    if ([testString isEqualToString:@""]) {
        return YES;
    }
    if ([[testString stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0) {
        return YES;
    }
    if ([[testString stringByReplacingOccurrencesOfString:@"\n" withString:@""] length] == 0) {
        return YES;
    }
    
    NSString* b = [testString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([b isEqualToString:@""]) {
        return YES;
    }
    return NO;
}
+(BOOL)hasValue:(id)o
{
    return ![self isNull:o];
}

@end
