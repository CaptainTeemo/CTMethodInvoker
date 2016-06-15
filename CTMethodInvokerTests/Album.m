//
//  Album.m
//  CTMethodInvoker
//
//  Created by CaptainTeemo on 6/15/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

#import "Album.h"

@implementation Album

- (instancetype)initWithArtist:(nonnull Artist *)artist name:(nonnull NSString *)name {
    self = [super init];
    
    if (self) {
        _artist = artist;
        _name = name;
    }
    
    return self;
}

- (NSString *)descriptionString {
    return [NSString stringWithFormat:@"name: %@, artist: %@ %@", _name, _artist.firstName, _artist.lastName];
}

- (void)printDescription {
    NSLog(@"%@", [self descriptionString]);
}

@end
