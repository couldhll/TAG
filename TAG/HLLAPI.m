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

@end