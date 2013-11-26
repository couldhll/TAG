//
//  HLLTOPriceViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLTOPriceViewController : UIViewController <HLLDropDownQuickViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property (strong, nonatomic) HLLCurrencyView *currencyView;
@property (strong, nonatomic) HLLCurrencyModel* currencyModel;
@property (assign, nonatomic) float priceUsd;

@end
