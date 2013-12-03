//
//  HLLUserModel.h
//  TAG
//
//  Created by CouldHll on 13-10-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HLLThirdAuthorizationModel @end

@interface HLLUserModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString<Optional>* email;
@property (strong, nonatomic) NSString<Optional>* name;
@property (strong, nonatomic) NSNumber<Optional>* followed;
@property (strong, nonatomic) NSURL<Optional>* thumbnail_image_url;
@property (strong, nonatomic) NSURL<Optional>* middle_image_url;
@property (strong, nonatomic) NSURL<Optional>* original_image_url;
@property (strong, nonatomic) NSString<Optional>* description;
@property (strong, nonatomic) NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>* thirds;

// for local save
@property (strong, nonatomic) NSString<Ignore>* password;

// for product
@property (strong, nonatomic) NSNumber<Optional>* product_success_rate;
@property (strong, nonatomic) NSNumber<Optional>* product_favorited_count;

- (BOOL)canTAGAuthorize;
- (BOOL)canThirdAuthorize;

@end
