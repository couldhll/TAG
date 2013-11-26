//
//  HLLTOTitleViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTOTitleViewController.h"

@interface HLLTOTitleViewController ()

@end

@implementation HLLTOTitleViewController

@synthesize brandImageUrl;
@synthesize brandName;
@synthesize productTime;

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

- (void)setBrandImageUrl:(NSURL*)url
{
    brandImageUrl=url;
    [self.brandImageView setImageWithURL:brandImageUrl placeholderImage:APPLICATION_IMAGE_LOADING_BRAND_UIIMAGE];
}

- (void)setBrandName:(NSString*)name
{
    brandName=name;
    [self updateProductTitleLabel];
}

- (void)setProductTime:(NSDate*)time
{
    productTime=time;
    [self updateProductTitleLabel];
}

#pragma mark - Private Methods

- (void)updateProductTitleLabel
{
    if ((brandName==nil)||(productTime==nil))
    {
        return;
    }
    
    // time string
    NSString *timeString=[NSString stringWithDateSinceNow:productTime];
    
    // product title
    NSString *productBuildString=[NSString stringWithFormat:@"%@ %@",brandName,timeString];
    NSMutableAttributedString* productBuildAttributedString = [NSMutableAttributedString attributedStringWithString:productBuildString];
    [productBuildAttributedString setFont:[UIFont fontWithFont:[UIFont fontWithName:APPLICATION_FONT_NAME size:12] style:UIFONT_LIGHT]];
    [productBuildAttributedString setTextColor:APPLICATION_COLOR_GREY];
    
    // brandName blod&color
    NSRange brandNameRange=NSMakeRange(0,brandName.length);
    [productBuildAttributedString setFont:[UIFont fontWithName:APPLICATION_FONT_NAME size:14] range:brandNameRange];
    [productBuildAttributedString setTextBold:YES range:brandNameRange];
    [productBuildAttributedString setTextColor:APPLICATION_COLOR_BLUE range:brandNameRange];
    
    // product title label
    self.productTitleLabel.attributedText=productBuildAttributedString;
}

@end
