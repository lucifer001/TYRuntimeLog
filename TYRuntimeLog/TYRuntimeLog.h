//
//  TYRuntimeLog.h
//  TYRuntimeLog
//
//  Created by PEND_Q on 2020/3/25.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYRuntimeLog : NSObject

/// 打印本类与父类的成员变量名称与类型
/// @param cls 要打印的类对象
+ (void)logIvarsWithClass:(Class)cls;

/// 打印本类与父类属性的名称与attributes
/// @param cls 要打印的类对象
+ (void)logPropertiesWithClass:(Class)cls;

/// 打印本类与父类的实例方法信息
/// @param cls 要打印的类对象
+ (void)logInstanceMethodWithClass:(Class)cls;

/// 打印本类与父类的类方法信息
/// @param cls 要打印的类对象
+ (void)logClassMethodWithClass:(Class)cls;

/// 打印类的继承结构
/// @param cls 要打印的类对象
+ (void)logInheritWithClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
