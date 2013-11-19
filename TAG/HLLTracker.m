//
//  HLLTracker.m
//  TAG
//
//  Created by CouldHll on 13-10-16.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTracker.h"

//#import <GAI.h>
//#import <GAITracker.h>
//#import <GAITrackedViewController.h>
//#import <GAIDictionaryBuilder.h>
//#import <GAIFields.h>
//#import <GAILogger.h>

@implementation HLLTracker

+ (void)eventWithCategory:(NSString*)category action:(NSString*)action object:(NSString*)object value:(NSString*)value
{
    // Segment.io
    if ([category isEqual:HLLTrackCategoryTypeView])
    {
        [[Analytics sharedAnalytics] screen:object properties:@{@"category":category,
                                                                @"label":action,
                                                                @"revenue":value}];
    }
    else
    {
        [[Analytics sharedAnalytics] track:object properties:@{@"category":category,
                                                               @"label":action,
                                                               @"revenue":value}];
    }

    
//    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
//    
//    NSMutableDictionary *event = [[GAIDictionaryBuilder createEventWithCategory:category
//                                                                         action:action
//                                                                          label:object
//                                                                          value:(NSNumber*)value] build];
//    [tracker send:event];
    
//    // button
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"appview", kGAIHitType, @"Home Screen", kGAIScreenName, nil];
//    [tracker send:params];
//    
//    // view
//    [tracker send:[[[GAIDictionaryBuilder createAppView] set:@"Home Screen" forKey:kGAIScreenName] build]];
    
    
//    NSMutableDictionary *event = [[GAIDictionaryBuilder createEventWithCategory:@"UI"
//                                                                         action:@"buttonPress"
//                                                                          label:@"dispatch"
//                                                                          value:nil] build];
    
//    [[GAI sharedInstance] dispatch];
    
    
    // backend
    NSString *ip=@"";// ip
    HLLUserModel *userModel=[HLLUserData sharedInstance].authorizationUser;// user id
    NSString *userId=[NSString stringWithFormat:@"%d",userModel.id];
    NSTimeInterval timeInterval=[[NSDate date] timeIntervalSince1970];// time stamp
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)timeInterval];
    [HLLDataJson tracking:nil
                       ip:ip
                   userId:userId
                 category:category
                   object:object
                   action:action
                    value:value
                     time:timeStamp
               completion:nil
                  success:nil
                    error:nil];
}

@end
