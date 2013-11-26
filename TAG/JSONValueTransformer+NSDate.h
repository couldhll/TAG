//
//  JSONValueTransformer+NSDate.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "JSONValueTransformer.h"

@interface JSONValueTransformer (NSDate)

- (NSDate*)NSDateFromNSString:(NSString*)string;
- (NSString*)JSONObjectFromNSDate:(NSDate*)date;

@end
