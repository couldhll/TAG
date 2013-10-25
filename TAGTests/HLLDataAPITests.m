//
//  HLLDataAPITests.m
//  TAG
//
//  Created by CouldHll on 13-10-11.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <CocoaSecurity/CocoaSecurity.h>

@interface HLLDataAPITests : XCTestCase

@end

@implementation HLLDataAPITests

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

- (void)testUserRegister
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[HLLDataAPI sharedInstance] userRegister:nil
                                        email:@"could_hll@hotmail.com"
                                         name:@"CouldHll"
                                     password:@"888888"
                                   completion:^(id json, JSONModelError *err) {
                                       HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                                       
                                       XCTAssertNotNil(userModel, @"model is nil.");
                                       
                                       dispatch_semaphore_signal(semaphore);
                                   }];
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    }
}



@end
