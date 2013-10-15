//
//  HLLMainMenuViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//


#import "HLLMainMenuViewController.h"

#import "HLLAppDelegate.h"

@interface HLLMainMenuViewController ()

@end

@implementation HLLMainMenuViewController

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
    
    // Notification
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(changeSelectButton:)
                                                 name: NOTIFICATION_OPENVIEWCONTROLLER
                                               object: nil];
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

#pragma mark - Actions

- (IBAction)productListButtonPressed:(id)sender
{
    [AppDelegate openViewController:@"HLLProductListViewController" sender:self];
}

- (IBAction)favoriteButtonPressed:(id)sender
{
    
}

- (IBAction)friendButtonPressed:(id)sender
{
    [AppDelegate openViewController:@"HLLUserFriendViewController" sender:self];
}

- (IBAction)followButtonPressed:(id)sender
{
    
}

- (IBAction)userHomeButtonPressed:(id)sender
{
    
}

- (IBAction)newCSButtonPressed:(id)sender
{
    
}

- (IBAction)settingButtonPressed:(id)sender
{
    
}

- (IBAction)loginorloginoutButtonPressed:(id)sender
{
    [AppDelegate openViewController:@"HLLUserLoginViewController" sender:self];
}

#pragma mark - Notification

- (void)changeSelectButton:(NSNotification *)notification
{
	[notification.userInfo objectForKey:@"name"];
    
}

@end
