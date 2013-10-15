//
//  HLLAPITests.m
//  TAG
//
//  Created by CouldHll on 13-10-11.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HLLAPI.h"

@interface HLLAPITests : XCTestCase

@end

@implementation HLLAPITests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsAuthorized
{
    XCTAssert([[HLLAPI sharedInstance] isAuthorized], @"User is authorized");
}

@end
