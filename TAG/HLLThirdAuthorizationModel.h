//
//  HLLThirdAuthorizationModel.h
//  TAG
//
//  Created by CouldHll on 13-10-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HLLThirdAuthorizationModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* user_id;
@property (strong, nonatomic) NSString<Ignore>* user_head_image;
@property (strong, nonatomic) NSString<Ignore>* user_description;

@end
