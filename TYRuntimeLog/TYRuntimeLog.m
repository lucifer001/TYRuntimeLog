//
//  TYRuntimeLog.m
//  TYRuntimeLog
//
//  Created by PEND_Q on 2020/3/25.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TYRuntimeLog.h"
#import <objc/runtime.h>
#import "TYMethodTypeEncoding.h"

@implementation TYRuntimeLog

+ (void)logIvarsWithClass:(Class)cls
{
    if (!cls ||
        [cls isMemberOfClass:object_getClass([NSObject class])]) {
        return;
    }
    unsigned int count;
    Ivar *ivars = class_copyIvarList(cls, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        /*
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        */
        NSLog(@"ivar: %s, type: %s", name, type);
    }
    free(ivars);
    [self logIvarsWithClass:[cls superclass]];
}

+ (void)logPropertiesWithClass:(Class)cls
{
    if (!cls ||
        [cls isMemberOfClass:object_getClass([NSObject class])]) {
        return;
    }
    unsigned int count;
    objc_property_t *propertys = class_copyPropertyList(cls, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        
        const char *name = property_getName(property);
        const char *attributes = property_getAttributes(property);
        
        NSLog(@"property: %s, attributes: %s", name, attributes);
    }
    free(propertys);
    [self logPropertiesWithClass:[cls superclass]];
}


+ (void)logInstanceMethodWithClass:(Class)cls
{
    [self logMethodWithClass:cls isClass:NO];
}

+ (void)logClassMethodWithClass:(Class)cls
{
    [self logMethodWithClass:cls isClass:YES];
}

+ (void)logMethodWithClass:(Class)cls isClass:(BOOL)isClass
{
    if (!cls ||
        [cls isMemberOfClass:object_getClass([NSObject class])]) {
        return;
    }
    unsigned int count;
    Method *methods;
    if (isClass) {
        methods = class_copyMethodList(object_getClass(cls), &count);
    } else {
        methods = class_copyMethodList(cls, &count);
    }
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        NSString *name = NSStringFromSelector(method_getName(method));
        const char *types = method_getTypeEncoding(method);
        IMP imp = method_getImplementation(method);
        NSMutableString *codeType = [NSMutableString stringWithString:@""];
        NSArray *ary = [name componentsSeparatedByString:@":"];
        char *returnType = method_copyReturnType(method);
        if (isClass) {
            [codeType appendFormat:@"+(%@)",[TYMethodTypeEncoding strWithCode:returnType]];
        } else {
            [codeType appendFormat:@"-(%@)",[TYMethodTypeEncoding strWithCode:returnType]];
        }
        free(returnType);
        unsigned int argumentCount = method_getNumberOfArguments(method);
        if (argumentCount == 2) {
            [codeType appendFormat:@"%@",ary[0]];
        }
        for (int j = 0; j < argumentCount; j++) {
            if (j >= 2) {
                [codeType appendFormat:@"%@",ary[j-2]];
                char *argumentType = method_copyArgumentType(method, j);
                [codeType appendFormat:@":(%@)xx ",[TYMethodTypeEncoding strWithCode:argumentType]];
                free(argumentType);
            }
        }
        NSLog(@"name: %@, types: %s, imp: %p", name, types, imp);
        NSLog(@"%@",codeType);
        NSLog(@"-----------------------------");
    }
    free(methods);
    [self logMethodWithClass:[cls superclass] isClass:isClass];
}

+ (void)logInheritWithClass:(Class)cls
{
    NSLog(@"%@", NSStringFromClass(cls));
    if (!cls ||
        [cls isMemberOfClass:object_getClass([NSObject class])]) {
        return;
    }
    NSLog(@"%@", @"  ↓");
    Class scls = class_getSuperclass(cls);
    [self logInheritWithClass:scls];
}

@end
