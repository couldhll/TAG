//
//  HLLDataAPIUserTests.m
//  TAG
//
//  Created by CouldHll on 13-10-11.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <CocoaSecurity/CocoaSecurity.h>

@interface HLLDataAPIUserTests : XCTestCase

@end

@implementation HLLDataAPIUserTests

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

- (void)testUserLogin
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson userLogin:nil
                    email:@"could_hll@hotmail.com"
                 password:@"888888"
               completion:nil
                  success:^(id json, JSONModelError *err) {
                      HLLUserModel *userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                      
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

- (void)testUserRegister
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    // random email for testing
    int i = arc4random()%1000;
    NSString *email=[NSString stringWithFormat:@"%@%000d%@",@"could_hll",i,@"@hotmail.com"];
    NSString *name=[NSString stringWithFormat:@"%@%000d",@"CouldHll",i];
    
    [HLLDataJson userRegister:nil
                        email:email
                         name:name
                     password:@"888888"
                   completion:nil
                      success:^(id json, JSONModelError *err) {
                          HLLUserModel *userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                          
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

- (void)testUserThirdLogin
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson userThirdLogin:nil
                       thirdId:DATA_API_THIRD_SINAWEIBO
                   thirdUserId:@"1775754523"
            thirdUserHeadImage:@"http://tp4.sinaimg.cn/1775754523/180/5599809696/1"
          thirdUserDescription:@"终身与科技作战"
                    completion:nil
                       success:^(id json, JSONModelError *err) {
                           HLLUserModel *userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                           
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

- (void)testUserLogout
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HLLDataJson userLogout:nil
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
