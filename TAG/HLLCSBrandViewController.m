//
//  HLLCSBrandViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCSBrandViewController.h"

@interface HLLCSBrandViewController ()

@end

@implementation HLLCSBrandViewController

@synthesize brandImageUrl;
@synthesize brandFollowed;
@synthesize brandName;
@synthesize brandDescription;
@synthesize brandLinks;

@synthesize brandId;

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

- (void)setBrandImageUrl:(NSURL *)url
{
    brandImageUrl=url;
    [self.brandImageView setImageWithURL:brandImageUrl placeholderImage:APPLICATION_IMAGE_LOADING_BRAND_UIIMAGE];
}

- (void)setBrandFollowed:(BOOL)followed
{
    brandFollowed=followed;
    self.brandFollowButton.followed=brandFollowed;
}

- (void)setBrandName:(NSString*)name
{
    brandName=name;
    self.brandNameLabel.text=brandName;
}

- (void)setBrandDescription:(NSString *)description
{
    brandDescription=description;
    self.brandDescriptionLabel.text=brandDescription;
}

- (void)setBrandLinks:(NSArray<HLLLinkModel> *)links
{
    brandLinks=links;
    self.brandLinkView.linkModels=brandLinks;
}

#pragma mark - Follow

- (IBAction)brandFollowButtonPressed:(id)sender
{
    HLLFollowButton *followButton=(HLLFollowButton*)sender;
    
    if (!followButton.followed)
    {
        [HLLDataAuthorizeProvider followingBrandAdd:nil
                                             brandId:[NSString stringWithFormat:@"%d",brandId]
                                          completion:nil
                                             success:^(id json, JSONModelError *err) {
                                                 // update state
                                                 followButton.followed=YES;
                                             }
                                               error:nil];
    }
    else
    {
        [HLLDataAuthorizeProvider followingBrandRemove:nil
                                                brandId:[NSString stringWithFormat:@"%d",brandId]
                                             completion:nil
                                                success:^(id json, JSONModelError *err) {
                                                    // update state
                                                    followButton.followed=NO;
                                                }
                                                  error:nil];
    }
}

#pragma mark - Private Methods

@end
