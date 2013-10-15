//
//  HLLAPI.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLAPI.h"

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
    
    
    
    // notification
    NSMutableDictionary *userInfo=[NSMutableDictionary dictionary];
    [userInfo setValue:[NSNumber numberWithBool:YES] forKey:@"logined"];
    [userInfo setValue:sender forKey:@"sender"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGELOGINSTATE object:self userInfo:userInfo];
}

@end