//
//  HLLDataAPICollectTests.m
//  TAG
//
//  Created by CouldHll on 13-11-13.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HLLDataAPICollectTests : XCTestCase

@end

@implementation HLLDataAPICollectTests

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

- (void)testCollectGetGroupInfo
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson collectGetGroupInfo:nil
                             groupId:@"4"
                          completion:nil
                             success:^(id json, JSONModelError *err) {
                                 HLLCollectGroupModel *collectGroupModel = [[HLLCollectGroupModel alloc] initWithDictionary:json error:nil];
                                 
                                 XCTAssertNotNil(collectGroupModel, @"model is nil.");
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

- (void)testCollectGetGroupList
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson collectGetGroupList:nil
                     completion:nil
                        success:^(id json, JSONModelError *err) {
                            HLLCollectGroupListModel *collectGroupListModel = [[HLLCollectGroupListModel alloc] initWithDictionary:json error:nil];
                            
                            XCTAssertNotNil(collectGroupListModel, @"model is nil.");
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

- (void)testCollectAddGroup
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson collectAddGroup:nil
                            name:@"Gourp6"
                      completion:nil
                         success:^(id json, JSONModelError *err) {
                             HLLCollectGroupModel *collectGroupModel = [[HLLCollectGroupModel alloc] initWithDictionary:json error:nil];
                             
                             XCTAssertNotNil(collectGroupModel, @"model is nil.");
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

- (void)testCollectRemoveGroup
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson collectRemoveGroup:nil
                            groupId:@"2"
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

- (void)testCollectAddProduct
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson collectAddProduct:nil
                         productId:@"1"
                           groupId:@"4"
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

- (void)testCollectRemoveProduct
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson collectRemoveProduct:nil
                            productId:@"1"
                              groupId:@"4"
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
