//
//  TYGeragekit.m
//  TYRuntimeLog
//
//  Created by PEND_Q on 2020/3/25.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TYGeragekit.h"

@implementation TYGeragekit

- (void)run:(NSArray *)ary arun:(BOOL)arun
{
    NSLog(@"%s", __func__);
}

- (block)test:(block)b
{
    NSLog(@"%s", __func__);
    return b;
}

+ (void)pose:(id)obj str:(NSString *)str
{
    NSLog(@"%s", __func__);
}

@end
