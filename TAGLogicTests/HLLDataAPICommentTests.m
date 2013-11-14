//
//  HLLDataAPICommentTests.m
//  TAG
//
//  Created by CouldHll on 13-11-13.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HLLDataAPICommentTests : XCTestCase

@end

@implementation HLLDataAPICommentTests

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

- (void)testCommentGetList
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson commentGetList:nil
                      productId:@"1"
                          count:@"15"
                           page:@"1"
                     completion:nil
                        success:^(id json, JSONModelError *err) {
                            HLLCommentListModel *commentListModel = [[HLLCommentListModel alloc] initWithDictionary:json error:nil];
                            
                            XCTAssertNotNil(commentListModel, @"model is nil.");
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

- (void)testCommentAdd
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson commentAdd:nil
                  productId:@"1"
                    comment:@"testing 'comment'."
                     completion:nil
                        success:^(id json, JSONModelError *err) {
                            HLLCommentModel *commentModel = [[HLLCommentModel alloc] initWithDictionary:json error:nil];
                            
                            XCTAssertNotNil(commentModel, @"model is nil.");
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

- (void)testCommentRemove
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson commentRemove:nil
                     commentId:@"1"
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
