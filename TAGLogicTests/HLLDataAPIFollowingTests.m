//
//  HLLDataAPIFollowingTests.m
//  TAG
//
//  Created by CouldHll on 13-11-14.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HLLDataAPIFollowingTests : XCTestCase

@end

@implementation HLLDataAPIFollowingTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    
    // login
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson userLogin:nil
                     email:@"could_hll@hotmail.com"
                  password:@"888888"
                completion:nil
                   success:^(id json, JSONModelError *err) {
                       HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                       
                       XCTAssertNotNil(userModel, @"model is nil.");
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

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testFowllowingBrandGetList
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson fowllowingBrandGetList:nil
                                  count:@"15"
                                   page:@"1"
                             needDetail:@"true"
                          completion:nil
                             success:^(id json, JSONModelError *err) {
                                 HLLFowllowingBrandListModel *fwllowingBrandListModel = [[HLLFowllowingBrandListModel alloc] initWithDictionary:json error:nil];
                                 
                                 XCTAssertNotNil(fwllowingBrandListModel, @"model is nil.");
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

- (void)testFowllowingBrandAdd
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson fowllowingBrandAdd:nil
                            brandId:@"1"
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

- (void)testFowllowingBrandRemove
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson fowllowingBrandRemove:nil
                               brandId:@"1"
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

- (void)testFowllowingUserGetList
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson fowllowingUserGetList:nil
                                 count:@"15"
                                  page:@"1"
                            needDetail:@"true"
                            completion:nil
                               success:^(id json, JSONModelError *err) {
                                   HLLFowllowingUserListModel *fowllowingUserListModel = [[HLLFowllowingUserListModel alloc] initWithDictionary:json error:nil];
                                   
                                   XCTAssertNotNil(fowllowingUserListModel, @"model is nil.");
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

- (void)testFowllowingUserAdd
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson fowllowingUserAdd:nil
                            userId:@"1"
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

- (void)testFowllowingUserRemove
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson fowllowingUserRemove:nil
                               userId:@"1"
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
