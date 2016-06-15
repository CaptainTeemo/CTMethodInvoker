//
//  CTMethodInvokerTests.m
//  CTMethodInvokerTests
//
//  Created by CaptainTeemo on 6/15/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CTMethodInvoker/CTMethodInvoker.h>

@interface CTMethodInvokerTests : XCTestCase

@end

@implementation CTMethodInvokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    id artist = [CTInvoker createInstanceWithURL:[NSURL URLWithString:@"Artist://initWithFirstName:lastName:"] parameters:@[@"Taylor", @"Swift"]];
    
    id album = [CTInvoker createInstanceWithURL:[NSURL URLWithString:@"Album://initWithArtist:name:"] parameters:@[artist, @"1989"]];
    
    NSString *desc = [CTInvoker invokeMethodWithInstance:album selectorString:@"descriptionString"];
    
    [CTInvoker invokeMethodWithInstance:album selectorString:@"printDescription"];
    
    NSLog(@"%@", desc);
    
    XCTAssertNotNil(desc);
}

@end
