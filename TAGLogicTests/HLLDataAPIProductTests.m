//
//  HLLDataAPIProductTests.m
//  TAG
//
//  Created by CouldHll on 13-11-13.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HLLDataAPIProductTests : XCTestCase

@end

@implementation HLLDataAPIProductTests

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

- (void)testProductGetList
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson productGetList:nil
                          count:@"15"
                           page:@"1"
                   searchOption:nil
                  searchKeyword:nil
                     completion:nil
                        success:^(id json, JSONModelError *err) {
                            HLLProductListModel *productListModel = [[HLLProductListModel alloc] initWithDictionary:json error:nil];
                            
                            XCTAssertNotNil(productListModel, @"model is nil.");
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

- (void)testProductGetInfo
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson productGetInfo:nil
                      productId:@"87"
                     completion:nil
                        success:^(id json, JSONModelError *err) {
                            HLLProductModel *productModel = [[HLLProductModel alloc] initWithDictionary:json error:nil];
                            
                            XCTAssertNotNil(productModel, @"model is nil.");
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
