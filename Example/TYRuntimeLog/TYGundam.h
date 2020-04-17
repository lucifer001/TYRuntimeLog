//
//  TYGundam.h
//  TYRuntimeLog
//
//  Created by PEND_Q on 2020/3/25.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TYGeragekit.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYGundam : TYGeragekit
{
    int count;
}

@property (strong, nonatomic) UIColor *color;

@property (assign, nonatomic) NSInteger wings;

- (void)biubiubiu;

+ (void)fly;

@end

NS_ASSUME_NONNULL_END
