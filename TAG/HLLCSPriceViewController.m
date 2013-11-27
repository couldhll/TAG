//
//  HLLCSPriceViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCSPriceViewController.h"

@interface HLLCSPriceViewController ()
{
    NSNumberFormatter *numberFormatter;
}

@end

@implementation HLLCSPriceViewController

@synthesize currencyModel;
@synthesize priceUsd;
@synthesize endTime;
@synthesize favoriteCount;
@synthesize subscribeCount;
@synthesize subscribeLevel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // number formatter
    numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"###0.##"];
    
    // init current view
    self.currencyView = [[HLLCurrencyView alloc] initWithFrame:CGRectMake(20, 6, 77, 37)];
    self.currencyView.delegate=self;
    [self.view addSubview:self.currencyView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Property

- (void)setCurrencyModel:(HLLCurrencyModel *)model
{
    currencyModel=model;
    
    [self updateCurrencyView];
    [self updatePriceLabel];
    [self updateSubscribeCount];
    [self updateSubscribeLevel];
}

- (void)setPriceUsd:(float)price
{
    priceUsd=price;
    [self setCurrencyModel:[HLLCurrencyModel getUsdCurrency]];
}

- (void)setEndTime:(NSDate *)time
{
    endTime=time;
    [self updateTimeLabel];
}

- (void)setFavoriteCount:(int)count
{
    favoriteCount=count;
    [self updateFavoriteLabel];
}

- (void)setSubscribeCount:(int)count
{
    subscribeCount=count;
    [self updateSubscribeCount];
}

- (void)setSubscribeLevel:(int)level
{
    subscribeLevel=level;
    [self updateSubscribeLevel];
}

#pragma mark - Private Methods

- (void)updateCurrencyView
{
    self.currencyView.title = currencyModel.name;
}

- (void)updatePriceLabel
{
    float currencyPrice=priceUsd*currencyModel.rate;
    self.priceLabel.text=[NSString stringWithFormat:@"%@%.2f",currencyModel.symbol,currencyPrice];
}

- (void)updateTimeLabel
{
    // day
    NSTimeInterval timeInterval = [endTime timeIntervalSinceNow];
    timeInterval = -timeInterval;
    int day=timeInterval/3600/24;
    
    NSString *dayString=day>0?[NSString stringWithFormat:@"%d",day]:NSLocalizedString(@"Product_Overdue",@"");
    self.timeLabel.text=[NSString stringWithFormat:@"%@",dayString];
}

- (void)updateFavoriteLabel
{
    self.favoriteLabel.text=[NSString stringWithFormat:@"%d",favoriteCount];
}

- (void)updateSubscribeCount
{
    // subscribe count
    NSNumber *subscribeCountNumber=[NSNumber numberWithInt:subscribeCount];
    NSString *subscribeCountString=[numberFormatter stringFromNumber:subscribeCountNumber];
    self.subscribeCountLabel.text=[NSString stringWithFormat:@"%@",subscribeCountString];
    
    // price count
    float currencyPriceCount=priceUsd*currencyModel.rate*subscribeCount;
    NSNumber *priceCountNumber=[NSNumber numberWithInt:currencyPriceCount];
    NSString *priceCountString=[numberFormatter stringFromNumber:priceCountNumber];
    self.priceCountLabel.text=[NSString stringWithFormat:@"%@%@",currencyModel.symbol,priceCountString];
}

- (void)updateSubscribeLevel
{
    // subscribe level
    NSNumber *subscribeLevelNumber=[NSNumber numberWithInt:subscribeLevel];
    NSString *subscribeLevelString=[numberFormatter stringFromNumber:subscribeLevelNumber];
    self.subscribeLevelLabel.text=[NSString stringWithFormat:@"of %@ backers",subscribeLevelString];
    
    // price level
    float currencyPriceLevel=priceUsd*currencyModel.rate*subscribeLevel;
    NSNumber *priceLevelNumber=[NSNumber numberWithInt:currencyPriceLevel];
    NSString *priceLevelString=[numberFormatter stringFromNumber:priceLevelNumber];
    self.priceLevelLabel.text=[NSString stringWithFormat:@"of %@%@",currencyModel.symbol,priceLevelString];
}

#pragma mark - Drop Down Selector Delegate

- (void)dropDownControlView:(HLLDropDownQuickView *)view didFinishWithSelection:(id)selection
{
    if (selection)
    {
        [self setCurrencyModel:selection];
    }
}

@end
