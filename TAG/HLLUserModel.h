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
@property (strong, nonatomic) NSString<Ignore>* password;// for local save
@property (strong, nonatomic) NSURL<Optional>* thumbnail_head_image_url;
@property (strong, nonatomic) NSURL<Optional>* middle_head_image_url;
@property (strong, nonatomic) NSURL<Optional>* original_head_image_url;
@property (strong, nonatomic) NSString<Optional>* description;
@property (strong, nonatomic) NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>* thirds;

// for product
@property (assign, nonatomic) float product_success_rate;
@property (assign, nonatomic) long product_favorited_count;

- (BOOL)canTAGAuthorize;
- (BOOL)canThirdAuthorize;

@end
