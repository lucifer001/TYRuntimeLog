//
//  TYMethodTypeEncoding.m
//  TYRuntimeLog
//
//  Created by PEND_Q on 2020/3/26.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TYMethodTypeEncoding.h"


@implementation TYMethodTypeEncoding

+ (NSString *)strWithCode:(char *)code
{
    NSString *str = [NSString stringWithUTF8String:code];
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    NSString *type = [self codeDic][str];
    if (!type || [type isEqualToString:@""]) {
        type = @"?";
    }
    return type;
}

+ (NSDictionary *)codeDic
{
    return @{@"c":@"char",
             @"i":@"int",
             @"s":@"short",
             @"l":@"long",
             @"q":@"long long",
             @"C":@"unsigned char",
             @"I":@"unsigned int",
             @"S":@"unsigned short",
             @"L":@"unsigned long",
             @"Q":@"unsigned long long",
             @"f":@"float",
             @"d":@"double",
             @"B":@"BOOL",
             @"v":@"void",
             @"*":@"char *",
             @"@":@"id",
             @"#":@"Class",
             @":":@"SEL",
             @"@?":@"Block",
    };
}

@end
