//
//  JSONValueTransformer+HLLProductType.m
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "JSONValueTransformer+HLLProductType.h"

@implementation JSONValueTransformer (HLLProductType)

- (HLLProductType)HLLProductTypeFromNSNumber:(NSNumber*)number
{
    HLLProductType productType=number.intValue;
    return productType;
}

- (NSNumber*)JSONObjectFromHLLProductType:(HLLProductType)productType
{
    NSNumber *number=[NSNumber numberWithInt:productType];
    return number;
}

@end
