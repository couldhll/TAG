//
//  HLLCurrencyModel.m
//  TAG
//
//  Created by CouldHll on 13-11-26.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCurrencyModel.h"

@implementation HLLCurrencyModel

+ (instancetype)getUsdCurrency
{
    HLLCurrencyModel *currencyModel = [[HLLCurrencyModel alloc] init];
    currencyModel.name=CURRENCY_USD_NAME;
    currencyModel.symbol=CURRENCY_USD_SYMBOL;
    currencyModel.rate=CURRENCY_USD_RATE;
    return currencyModel;
}

+ (instancetype)getRmbCurrency
{
    HLLCurrencyModel *currencyModel = [[HLLCurrencyModel alloc] init];
    currencyModel.name=CURRENCY_RMB_NAME;
    currencyModel.symbol=CURRENCY_RMB_SYMBOL;
    currencyModel.rate=CURRENCY_RMB_RATE;
    return currencyModel;
}

@end
