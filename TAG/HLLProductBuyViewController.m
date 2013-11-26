//
//  HLLTOBuyViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductBuyViewController.h"

#define PRODUCT_BUY_BUTTON_NAME_TO @"BUY"
#define PRODUCT_BUY_BUTTON_NAME_CS @"PLEDGE"

@interface HLLProductBuyViewController ()

@end

@implementation HLLProductBuyViewController

@synthesize productType;

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
    
    // correct:set productType before [UIView:addSubView:]
    [self updateBuyButton];
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

- (void)setProductType:(HLLProductType)type
{
    productType=type;
    
    [self updateBuyButton];
}

#pragma mark - Private Methods

- (void)updateBuyButton
{
    if (productType==HLLProductTypeCS)
    {
        [self.buyButton setTitle:PRODUCT_BUY_BUTTON_NAME_CS forState:UIControlStateNormal];
    }
    else
    {
        [self.buyButton setTitle:PRODUCT_BUY_BUTTON_NAME_TO forState:UIControlStateNormal];
    }
}

#pragma mark - Actions

- (IBAction)saveButtonPressed:(id)sender
{
    // delegate
    if([self.delegate respondsToSelector:@selector(viewController:save:)])
    {
        [self.delegate viewController:self save:sender];
    }
}

- (IBAction)buyButtonPressed:(id)sender
{
    // delegate
    if([self.delegate respondsToSelector:@selector(viewController:buy:)])
    {
        [self.delegate viewController:self buy:sender];
    }
}

@end
