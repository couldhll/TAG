//
//  HLLCSPriceViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLCSPriceViewController : UIViewController <HLLDropDownQuickViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (strong, nonatomic) IBOutlet UILabel *subscribeLevelLabel;
@property (strong, nonatomic) IBOutlet UILabel *subscribeCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLevelLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceCountLabel;

@property (strong, nonatomic) HLLCurrencyView *currencyView;
@property (strong, nonatomic) HLLCurrencyModel* currencyModel;
@property (assign, nonatomic) float priceUsd;
@property (strong, nonatomic) NSDate *endTime;
@property (assign, nonatomic) int favoriteCount;
@property (assign, nonatomic) int subscribeCount;
@property (assign, nonatomic) int subscribeLevel;

@end
