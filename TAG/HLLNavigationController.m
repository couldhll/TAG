//
//  HLLNavigationController.m
//  TAG
//
//  Created by CouldHll on 13-10-12.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLNavigationController.h"

@interface HLLNavigationController ()

@end

@implementation HLLNavigationController

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
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"Resource/Frame/Navigation/bar_background.png"] forBarMetrics:UIBarMetricsDefault];

    //    // navigation center image
    //    UIImage * titleImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_logo.png"];
    //    UIImageView * titleview = [[UIImageView alloc]initWithImage:titleImage];
    //    self.navigationItem.titleView =titleview;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // close left controller
    [self.viewDeckController closeLeftViewAnimated:YES];
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

@end
