//
//  JSONValueTransformer+NSDate.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "JSONValueTransformer+NSDate.h"

@implementation JSONValueTransformer (NSDate)

- (NSDate*)NSDateFromNSString:(NSString*)string
{
    NSTimeInterval timeInterval = [string doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

- (NSString*)JSONObjectFromNSDate:(NSDate*)date
{
    NSTimeInterval timeInterval=[date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%f",timeInterval];
}

@end
