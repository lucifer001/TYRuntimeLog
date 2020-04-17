//
//  ViewController.m
//  TYRuntimeLog
//
//  Created by PEND_Q on 2020/3/25.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "ViewController.h"
#import "TYRuntimeLog.h"

#import "TYGeragekit.h"
#import "TYGundam.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 测试代码
    
    [TYRuntimeLog logIvarsWithClass:[TYGundam class]];
    [TYRuntimeLog logPropertiesWithClass:[TYGundam class]];
    [TYRuntimeLog logInstanceMethodWithClass:[TYGundam class]];
    [TYRuntimeLog logClassMethodWithClass:[TYGundam class]];
    [TYRuntimeLog logInheritWithClass:[TYGundam class]];
    
    [TYRuntimeLog logIvarsWithClass:[UIView class]];
    [TYRuntimeLog logPropertiesWithClass:[UIControl class]];
    [TYRuntimeLog logInstanceMethodWithClass:[NSArray class]];
    [TYRuntimeLog logClassMethodWithClass:[NSHashTable class]];
    [TYRuntimeLog logInheritWithClass:[UICollectionView class]];
    
}


@end
