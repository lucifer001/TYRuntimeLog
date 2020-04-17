//
//  TYGeragekit.h
//  TYRuntimeLog
//
//  Created by PEND_Q on 2020/3/25.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef int(^block)(float f);

@interface TYGeragekit : NSObject
{
    float _height;
    float _weight;
}

@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *name;

- (void)run:(NSArray *)ary arun:(BOOL)arun;

- (block)test:(block)b;

+ (void)pose:(id)obj str:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
