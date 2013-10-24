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

+ (void)send:(NSString*)object action:(NSString*)action value:(NSString*)value category:(NSString*)category
{
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
    
    
    // back end
    // userid,time,ip
}

@end
