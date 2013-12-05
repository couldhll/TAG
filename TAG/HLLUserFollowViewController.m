//
//  HLLUserFollowViewController.m
//  TAG
//
//  Created by CouldHll on 13-12-2.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserFollowViewController.h"

@interface HLLUserFollowViewController ()

@end

@implementation HLLUserFollowViewController

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
    
    // navigation background image
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Resource/Frame/Navigation/bar_white_background.png"] forBarMetrics:UIBarMetricsDefault];
    
    self.title=@"MY FOLLOWS";
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

@end
