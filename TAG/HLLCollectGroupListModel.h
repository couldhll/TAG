//
//  HLLCollectGroupListModel.h
//  TAG
//
//  Created by CouldHll on 13-11-13.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HLLCollectGroupModel @end

@interface HLLCollectGroupListModel : JSONModel

@property (strong, nonatomic) NSArray<HLLCollectGroupModel>* groups;

@end
