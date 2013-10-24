//
//  HLLAPI.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataAPI.h"

#import <CocoaSecurity/CocoaSecurity.h>

@implementation HLLDataAPI

#pragma mark - Singleton methods

+ (HLLDataAPI *)sharedInstance
{
    static HLLDataAPI *sharedInstance = nil;
    static dispatch_once_t  oncePredicate;

    dispatch_once(&oncePredicate, ^{
            sharedInstance = [[self alloc] init];
//            sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAPIHost]];
        });

    return sharedInstance;
}



- (BOOL)isAuthorized
{
    return YES;
}

- (void)save:(UIViewController*)sender
{
    [AppDelegate openViewController:@"HLLUserLoginViewController" sender:sender];
}

- (void)userRegisterWithEmail:(NSString*)email name:(NSString*)name password:(NSString*)password completion:(JSONObjectBlock)completeBlock
{
    CocoaSecurityResult *passwordMd5 = [CocoaSecurity md5:password];
    
    [JSONHTTPClient postJSONFromURLWithString:@"https://api.github.com/users/icanzilb"
                                       params:@{@"email":email,
                                                @"name":name,
                                                @"password":passwordMd5.hex}
                                   completion:^(id json, JSONModelError* e) {
//                                       json=@"{\"error_code\":{\"result\":1,\"userid\":75579,\"usertype\":0}}";
//                                       {
//                                           "error_code" = 103;
//                                           "error_description" = "\U8be5\U7528\U6237\U4e0d\U5b58\U5728";
//                                           request = "/User/Login";
//                                       }

                                       HLLErrorModel* errorModel = [[HLLErrorModel alloc] initWithString:json error:nil];
                                       
                                       
                                       if (completeBlock) completeBlock(json, e);
                                   }];
}

@end