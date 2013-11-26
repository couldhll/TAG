//
//  HLLTOPriceViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTOPriceViewController.h"

@interface HLLTOPriceViewController ()

@end

@implementation HLLTOPriceViewController

@synthesize currencyModel;
@synthesize priceUsd;

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
}

- (void)setPriceUsd:(float)price
{
    priceUsd=price;
    [self setCurrencyModel:[HLLCurrencyModel getUsdCurrency]];
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

#pragma mark - Drop Down Selector Delegate

- (void)dropDownControlView:(HLLDropDownQuickView *)view didFinishWithSelection:(id)selection
{
    if (selection)
    {
        [self setCurrencyModel:selection];
    }
}

@end
