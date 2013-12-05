//
//  HLLProductModel.h
//  TAG
//
//  Created by CouldHll on 13-10-29.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol NSURL @end

@interface HLLProductModel : JSONModel

@property (strong, nonatomic) NSDate<Optional>* created_at;
@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString<Optional>* name;
@property (strong, nonatomic) NSNumber<Optional>* show_type;
@property (strong, nonatomic) NSURL<Optional>* thumbnail_image_url;
@property (strong, nonatomic) NSURL<Optional>* middle_image_url;
@property (strong, nonatomic) NSURL<Optional>* original_image_url;
@property (strong, nonatomic) NSNumber<Optional>* favorited;
@property (strong, nonatomic) NSNumber<Optional>* favorited_count;
@property (strong, nonatomic) NSString<Optional>* information;
@property (strong, nonatomic) NSArray<Optional,ConvertOnDemand>* video_urls;
@property (strong, nonatomic) NSNumber<Optional>* price_usd;
@property (strong, nonatomic) NSURL<Optional>* buy_url;

// only for cs product
@property (strong, nonatomic) NSDate<Optional>* start_time;
@property (strong, nonatomic) NSDate<Optional>* end_time;
@property (strong, nonatomic) NSNumber<Optional>* subscribe_count;
@property (strong, nonatomic) NSNumber<Optional>* subscribe_level;

@property (strong, nonatomic) HLLBrandModel<Optional,ConvertOnDemand>* brand;
@property (strong, nonatomic) HLLUserModel<Optional,ConvertOnDemand>* user;

@end
