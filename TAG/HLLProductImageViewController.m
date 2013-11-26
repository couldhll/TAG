//
//  HLLProductImageViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductImageViewController.h"

@interface HLLProductImageViewController ()

@end

@implementation HLLProductImageViewController

@synthesize productImageUrl;

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

- (void)setProductImageUrl:(NSURL*)url
{
    productImageUrl=url;
    [self.productImageView setImageWithURL:productImageUrl placeholderImage:APPLICATION_IMAGE_LOADING_PRODUCT_UIIMAGE];
}

@end
