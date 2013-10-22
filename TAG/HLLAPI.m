//
//  HLLAPI.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLAPI.h"

#import <JSONModel/JSONHTTPClient.h>

@implementation HLLAPI

#pragma mark - Singleton methods

/**
 * Singleton methods
 */
+ (HLLAPI *)sharedInstance
{
    static HLLAPI *sharedInstance = nil;
    static dispatch_once_t  oncePredicate;

    dispatch_once(&oncePredicate, ^{
            sharedInstance = [[self alloc] init];
//            sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAPIHost]];
        });

    return sharedInstance;
}

-(BOOL)isAuthorized
{
    return YES;
}

-(void)save:(UIViewController*)sender
{
    [AppDelegate openViewController:@"HLLUserLoginViewController" sender:sender];
}


-(void)test
{
    [JSONHTTPClient postJSONFromURLWithString:@"http://api.tagoriginals.com/User/Register"
                                       params:@{@"email":@"value1",
                                                @"name":@"haha",
                                                @"password":@"haha2"}
                                   completion:^(id json, JSONModelError *err)
                                   {
                                       
                                       HLLUserModel* userModel = [[HLLUserModel alloc] initWithString:json error:nil];
//                                       userModel.name = @"Changed Name";
                                       
//                                       //convert to dictionary
//                                       NSDictionary* dict = [pm toDictionary];
//                                       
//                                       //convert to text
//                                       NSString* string = [pm toJSONString];
                                       
                                   }];
}
@end