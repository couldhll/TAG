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
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_UPDATEPASSWORD_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_UPDATEINFO_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_BIND_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_UNBIND_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_LOGOUT_URL];

    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COMMENT_ADD_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COMMENT_REMOTE_URL];
    
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COLLECT_GETGROUPINFO_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COLLECT_GETGROUPLIST_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COLLECT_ADDGROUP_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COLLECT_REMOVEGROUP_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COLLECT_ADD_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_COLLECT_REMOVE_URL];
    
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_FOLLOWING_BRAND_GETLIST_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_FOLLOWING_BRAND_ADD_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_FOLLOWING_BRAND_REMOVE_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_FOLLOWING_USER_GETLIST_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_FOLLOWING_USER_ADD_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_FOLLOWING_USER_REMOVE_URL];
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
        if (![[HLLUserData sharedInstance] checkAuthorize:nil popupLoginView:YES])// no authorize in local
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
