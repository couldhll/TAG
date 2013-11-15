//
//  HLLCollectGroupModel.h
//  TAG
//
//  Created by CouldHll on 13-11-13.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HLLCollectGroupModel : JSONModel

@property (strong, nonatomic) NSDate<Optional>* created_at;
@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString<Optional>* name;
@property (strong, nonatomic) NSArray<HLLProductModel,Optional,ConvertOnDemand>* products;

@end