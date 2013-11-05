//
//  HLLDataAuthorizeProvider.m
//  TAG
//
//  Created by CouldHll on 13-11-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataAuthorizeProvider.h"

static NSMutableDictionary* needAuthorizationDictionary;

@implementation HLLDataAuthorizeProvider

#pragma mark - Init

+ (void)initialize
{
    // map with button and notification
    needAuthorizationDictionary=[NSMutableDictionary dictionary];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_GETINFO_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_UPDATEINFO_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_LOGOUT_URL];
    
}

#pragma mark - Support methods

+ (void)postJSONWithUrl:(NSString*)url params:(NSDictionary *)params completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // calculate needAuthorization
    BOOL needAuthorization=NO;
    NSNumber *needAuthorizationValue=[needAuthorizationDictionary valueForKey:url];
    if (needAuthorizationValue!=nil)
    {
        needAuthorization=needAuthorizationValue.boolValue;
    }
    
    if (needAuthorization)// need authorize
    {
        if (![[HLLUserData sharedInstance] checkAuthorize:nil])// no authorize in local
        {
            return;
        }
    }
    
    // post data
    [super postJSONWithUrl:url
                    params:params
                completion:completeBlock
                   success:successBlock
                     error:errorBlock];
}

@end
