//
//  HLLDataAPITrackingTests.m
//  TAG
//
//  Created by CouldHll on 13-11-14.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HLLDataAPITrackingTests : XCTestCase

@end

@implementation HLLDataAPITrackingTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testTracking
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    long long int time = (long long int)timeInterval;
    NSString *timeString=[NSString stringWithFormat:@"%lld", time];
    
    [HLLDataJson tracking:nil
                       ip:@"222.222.222.222"
                   userId:@"1"
                 category:@"Page"
                   object:@"TestPage"
                   action:@"Enter"
                    value:nil
                     time:timeString
                         completion:nil
                            success:^(id json, JSONModelError *err) {
                                HLLSuccessModel *successModel = [[HLLSuccessModel alloc] initWithDictionary:json error:nil];
                                
                                XCTAssertNotNil(successModel, @"model is nil.");
                                dispatch_semaphore_signal(semaphore);
                            }
                              error:^(HLLErrorModel *err) {
                                  XCTFail(@"ERROR:[%@]%@",err.error_code,err.error_description);
                                  dispatch_semaphore_signal(semaphore);
                              }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    }
}

@end
