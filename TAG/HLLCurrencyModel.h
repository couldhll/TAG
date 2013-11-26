//
//  HLLCurrencyModel.h
//  TAG
//
//  Created by CouldHll on 13-11-26.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#define CURRENCY_USD_NAME @"USD"
#define CURRENCY_USD_SYMBOL @"$"
#define CURRENCY_USD_RATE 1.0
#define CURRENCY_RMB_NAME @"RMB"
#define CURRENCY_RMB_SYMBOL @"￥"
#define CURRENCY_RMB_RATE 6.0924

#define CURRENCY_MAIN_NAME CURRENCY_USD_NAME
#define CURRENCY_MAIN_SYMBOL CURRENCY_USD_SYMBOL
#define CURRENCY_MAIN_RATE CURRENCY_USD_RATE

@interface HLLCurrencyModel : JSONModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *symbol;
@property (assign, nonatomic) float rate;

+ (HLLCurrencyModel*)getUsdCurrency;
+ (HLLCurrencyModel*)getRmbCurrency;

@end
