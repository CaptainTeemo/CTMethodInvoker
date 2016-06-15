//
//  Artist.m
//  CTMethodInvoker
//
//  Created by CaptainTeemo on 6/15/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
    }
    
    return self;
}

@end
