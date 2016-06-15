//
//  CTInvoker.m
//  CTMethodInvoker
//
//  Created by CaptainTeemo on 6/15/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

#import "CTInvoker.h"

@implementation CTInvoker

#pragma mark - CreateInstance

+ (nullable id)createInstanceWithURL:(nonnull NSURL *)url {
    return [[self class] createInstanceWithURL:url parameters:nil];
}

+ (nullable id)createInstanceWithURL: (nonnull NSURL *)url parameters: (nullable NSArray<id> *)params {
    Class ClassType = NSClassFromString(url.scheme);
    id instance = [ClassType alloc];
    
    NSString *selectorString = [url.resourceSpecifier stringByReplacingOccurrencesOfString:@"//" withString:@""];
    
    return [[self class] invokeMethodWithInstance:instance selectorString:selectorString parameters:params];
}

#pragma mark - InvokeMethod

+ (nullable id)invokeMethodWithInstance: (nonnull id)instance selectorString: (nonnull NSString *)selectorString {
    return [[self class] invokeMethodWithInstance:instance selectorString:selectorString parameters:nil];
}

+ (nullable id)invokeMethodWithInstance: (nonnull id)instance selectorString: (nonnull NSString *)selectorString parameters: (nullable NSArray <id> *)params {
    
    Class ClassType = [instance class];
    
    SEL selector = NSSelectorFromString(selectorString);
    
    NSAssert([ClassType instancesRespondToSelector:selector], @"Invalid selector");
    
    NSMethodSignature *methodSignature = [ClassType instanceMethodSignatureForSelector:selector];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    
    if (params) {
        [params enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSNumber class]]) {
                NSInteger arg = [(NSNumber *)obj integerValue];
                [invocation setArgument:&arg atIndex:idx + 2];
                return;
            }
            [invocation setArgument:&obj atIndex:idx + 2];
        }];
    }
    
    invocation.target = instance;
    invocation.selector = selector;
    
    [invocation invoke];
    
    NSString *returnTypeString = [NSString stringWithCString:methodSignature.methodReturnType encoding:NSUTF8StringEncoding];
    
    if ([returnTypeString isEqualToString:@"v"]) {
        return nil;
    }
    
    void *result;
    [invocation getReturnValue:&result];
    
    return (__bridge id)result;
}

@end
