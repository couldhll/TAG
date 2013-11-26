//
//  HLLViewController.m
//  TAG
//
//  Created by CouldHll on 13-9-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLViewController.h"

@interface HLLViewController ()

@end

@implementation HLLViewController

@synthesize className;
@synthesize trackingName;

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

#pragma mark - Property

- (NSString*)className
{
    return NSStringFromClass(self.class);
}

- (NSString*)trackingName
{
    NSString *result;
    
    if (trackingName)
    {
        result=trackingName;
    }
    else
    {
        result=self.className;
    }
    
    return result;
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
    
    // tracking view appear
    [HLLTracker eventWithCategory:HLLTrackCategoryTypeView action:HLLTrackActionTypeViewAppear object:self.trackingName value:HLLTrackValueTypeNone];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // tracking view disappear
    [HLLTracker eventWithCategory:HLLTrackCategoryTypeView action:HLLTrackActionTypeViewDisappear object:self.trackingName value:HLLTrackValueTypeNone];
}

#pragma mark - Public Methods

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
