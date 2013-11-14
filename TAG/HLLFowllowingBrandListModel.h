//
//  HLLFowllowingBrandListModel.h
//  TAG
//
//  Created by CouldHll on 13-11-14.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HLLBrandModel @end

@interface HLLFowllowingBrandListModel : JSONModel

@property (strong, nonatomic) NSArray<HLLBrandModel>* brands;

@end
