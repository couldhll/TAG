//
//  HLLCurrencyView.h
//  TAG
//
//  Created by CouldHll on 13-11-25.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDropDownQuickView.h"

@protocol HLLCurrencyModel @end

@interface HLLCurrencyView : HLLDropDownQuickView

@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray<HLLCurrencyModel> *options;

@end
