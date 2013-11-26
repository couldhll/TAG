//
//  HLLCSTitleViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCSTitleViewController.h"

#define PRODUCT_BUILD_STRING @"design by"

@interface HLLCSTitleViewController ()

@end

@implementation HLLCSTitleViewController

@synthesize productName;
@synthesize brandName;
@synthesize userName;

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

- (void)setProductName:(NSString*)name
{
    productName=name;
    self.productNameLabel.text=[NSString stringWithFormat:@"""%@""",name];// "name"
}

- (void)setBrandName:(NSString*)name
{
    brandName=name;
    [self updateProductBuildLabel];
}

- (void)setUserName:(NSString*)name
{
    userName=name;
    [self updateProductBuildLabel];
}

#pragma mark - Private Methods

- (void)updateProductBuildLabel
{
    if ((brandName==nil)||(userName==nil))
    {
        return;
    }
    
    // product build
    NSString *productBuildString=[NSString stringWithFormat:@"%@ %@ %@",brandName,PRODUCT_BUILD_STRING,userName];
    NSMutableAttributedString* productBuildAttributedString = [NSMutableAttributedString attributedStringWithString:productBuildString];
    [productBuildAttributedString setFont:[UIFont fontWithFont:[UIFont fontWithName:APPLICATION_FONT_NAME size:12] style:UIFONT_LIGHT]];
    [productBuildAttributedString setTextColor:[UIColor whiteColor]];
    [productBuildAttributedString setTextAlignment:kCTTextAlignmentCenter lineBreakMode:kCTLineBreakByClipping];
    
    // brandName blod&color
    NSRange brandNameRange=NSMakeRange(0,brandName.length);
    [productBuildAttributedString setTextBold:YES range:brandNameRange];
    [productBuildAttributedString setTextColor:APPLICATION_COLOR_YELLOW range:brandNameRange];
    
    // userName blod&color
    NSRange userNameRange=NSMakeRange(productBuildString.length-userName.length-1,userName.length);
    [productBuildAttributedString setTextBold:YES range:userNameRange];
    [productBuildAttributedString setTextColor:APPLICATION_COLOR_YELLOW range:userNameRange];
    
    // product build label
    self.productBuildLabel.attributedText=productBuildAttributedString;
}

@end
