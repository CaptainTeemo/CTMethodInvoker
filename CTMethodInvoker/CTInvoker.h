//
//  CTInvoker.h
//  CTMethodInvoker
//
//  Created by CaptainTeemo on 6/15/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTInvoker : NSObject

/**
 *  This method was designed to call init method of class.
 *
 *  @param url Example: [NSURL URLWithString: @"SomeObject://init"].
 *
 *  @return Concrete object.
 */
+ (nullable id)createInstanceWithURL:(nonnull NSURL *)url;

/**
 *  Same as above with parameters.
 *
 *  @param url    Example: [NSURL URLWithString: @"SomeObject://initWithFirstName:lastName:"]
 *  @param params Parameters are passed as NSArray. For the example above, parameters should be like @[@"Captain", @"Teemo"].
 *
 *  @return Concrete object.
 */
+ (nullable id)createInstanceWithURL: (nonnull NSURL *)url parameters: (nullable NSArray<id> *)params;

/**
 *  Send message to object instance.
 *
 *  @param instance       Some object instance.
 *  @param selectorString Selector represents in string.
 *
 *  @return Return value of method if there is, otherwise nil.
 */
+ (nullable id)invokeMethodWithInstance: (nonnull id)instance selectorString: (nonnull NSString *)selectorString;

/**
 *  Same as above with parameters.
 *
 *  @param instance       Some object instance.
 *  @param selectorString Selector represents in string.
 *  @param params         Same as createInstanceWithURL:parameters:
 *
 *  @return Return value of method if there is, otherwise nil.
 */
+ (nullable id)invokeMethodWithInstance: (nonnull id)instance selectorString: (nonnull NSString *)selectorString parameters: (nullable NSArray <id> *)params;

@end
