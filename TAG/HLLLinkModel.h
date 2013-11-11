//
//  HLLLinkModel.h
//  TAG
//
//  Created by CouldHll on 13-11-6.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HLLLinkModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSURL* url;

@end
