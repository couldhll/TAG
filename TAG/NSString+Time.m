//
//  NSString+Time.m
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)

+ (NSString*)stringWithDateSinceNow:(NSDate*)date
{
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:NSLocalizedString(@"Time_Format_Now",@"")];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:NSLocalizedString(@"Time_Format_Minute",@""),temp];
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:NSLocalizedString(@"Time_Format_Hour",@""),temp];
    }
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:NSLocalizedString(@"Time_Format_Day",@""),temp];
    }
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:NSLocalizedString(@"Time_Format_Month",@""),temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:NSLocalizedString(@"Time_Format_Year",@""),temp];
    }
    
    return result;
}

@end
