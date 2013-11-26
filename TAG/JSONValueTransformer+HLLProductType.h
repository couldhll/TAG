//
//  JSONValueTransformer+HLLProductType.h
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "JSONValueTransformer.h"

@interface JSONValueTransformer (HLLProductType)

- (HLLProductType)HLLProductTypeFromNSNumber:(NSNumber*)number;
- (NSNumber*)JSONObjectFromHLLProductType:(HLLProductType)productType;

@end
