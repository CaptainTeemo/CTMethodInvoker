//
//  Album.h
//  CTMethodInvoker
//
//  Created by CaptainTeemo on 6/15/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

@interface Album : NSObject

@property (nonnull, nonatomic, strong) Artist *artist;
@property (nonnull, nonatomic, copy) NSString *name;

- (nullable instancetype)initWithArtist: (nonnull Artist *)artist name: (nonnull NSString *)name;

@end
