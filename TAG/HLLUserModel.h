//
//  HLLUserModel.h
//  TAG
//
//  Created by CouldHll on 13-10-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "HLLThirdAuthorizationModel.h"

@interface HLLUserModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSURL* thumbnail_head_image_url;
@property (strong, nonatomic) NSURL* middle_head_image_url;
@property (strong, nonatomic) NSURL* original_head_image_url;
//@property (strong, nonatomic) NSArray<HLLThirdAuthorizationModel>* thirds;

@end
