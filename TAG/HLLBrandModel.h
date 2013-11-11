//
//  HLLBrandModel.h
//  TAG
//
//  Created by CouldHll on 13-10-29.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HLLLinkModel @end
@protocol HLLProductModel @end

@interface HLLBrandModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString<Optional>* name;
@property (assign, nonatomic) bool followed;
@property (strong, nonatomic) NSString<Optional>* description;
@property (strong, nonatomic) NSURL<Optional>* thumbnail_image_url;
@property (strong, nonatomic) NSURL<Optional>* middle_image_url;
@property (strong, nonatomic) NSURL<Optional>* original_image_url;
@property (strong, nonatomic) NSArray<HLLLinkModel,Optional,ConvertOnDemand>* links;
@property (strong, nonatomic) NSArray<HLLProductModel,Optional,ConvertOnDemand>* products;

@end
