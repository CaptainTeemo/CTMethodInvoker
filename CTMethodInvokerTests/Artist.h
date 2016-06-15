//
//  Artist.h
//  CTMethodInvoker
//
//  Created by CaptainTeemo on 6/15/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject
@property (nonnull, nonatomic, copy) NSString *firstName;
@property (nonnull, nonatomic, copy) NSString *lastName;

- (nullable instancetype)initWithFirstName: (nonnull NSString *)firstName lastName: (nonnull NSString *)lastName;
@end
