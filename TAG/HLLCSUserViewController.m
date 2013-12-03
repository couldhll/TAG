//
//  HLLCSUserViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCSUserViewController.h"

@interface HLLCSUserViewController ()

@end

@implementation HLLCSUserViewController

@synthesize userImageUrl;
@synthesize userFollowed;
@synthesize userName;
@synthesize userDescription;
@synthesize productSuccessRate;
@synthesize productFavoritedCount;

@synthesize userId;

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

- (void)setUserImageUrl:(NSURL *)url
{
    userImageUrl=url;
    [self.userImageView setImageWithURL:userImageUrl placeholderImage:APPLICATION_IMAGE_LOADING_USER_UIIMAGE];
}

- (void)setUserFollowed:(BOOL)followed
{
    userFollowed=followed;
    self.userFollowButton.followed=userFollowed;
}

- (void)setUserName:(NSString*)name
{
    userName=name;
    self.userNameLabel.text=userName;
}

- (void)setUserDescription:(NSString *)description
{
    userDescription=description;
    self.userDescriptionLabel.text=userDescription;
}

- (void)setProductSuccessRate:(float)rate
{
    productSuccessRate=rate;
    self.productSuccessRateLabel.text=[NSString stringWithFormat:@"%.0f%%",productSuccessRate];
}

- (void)setProductFavoritedCount:(int)count
{
    productFavoritedCount=count;
    self.productFavoritedCountLabel.text=[NSString stringWithFormat:@"%d",productFavoritedCount];
}

#pragma mark - Follow

- (IBAction)userFollowButtonPressed:(id)sender
{
    HLLFollowButton *followButton=(HLLFollowButton*)sender;
    
    if (!followButton.followed)
    {
        [HLLDataAuthorizeProvider followingUserAdd:nil
                                             userId:[NSString stringWithFormat:@"%d",userId]
                                          completion:nil
                                             success:^(id json, JSONModelError *err) {
                                                 // update state
                                                 followButton.followed=YES;
                                             }
                                               error:nil];
    }
    else
    {
        [HLLDataAuthorizeProvider followingUserRemove:nil
                                                userId:[NSString stringWithFormat:@"%d",userId]
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
