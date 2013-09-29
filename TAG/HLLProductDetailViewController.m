//
//  HLLProductDetailViewController.m
//  TAG
//
//  Created by CouldHll on 13-9-23.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductDetailViewController.h"

#import "IIViewDeckController.h"
#import "HLLVideoView.h"

#define VIDEOVIEW_SIZE CGSizeMake(200, 200)

@interface HLLProductDetailViewController () <UINavigationControllerDelegate>

@end

@implementation HLLProductDetailViewController

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
    
    self.title = @"Product Detail";
    
    // navigation bar
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:
                                              [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)],
                                              [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(gotoBackPage:)],
                                              nil];
    CGSize videoViewSize=VIDEOVIEW_SIZE;
    
    // add video view
    HLLVideoView *videoView=[[HLLVideoView alloc] initWithFrame:CGRectMake(100, 100, videoViewSize.width, videoViewSize.height)];
    [videoView loadVideo:@"http://player.youku.com/embed/XNjA4NjU4MzYw"];
    [self.view addSubview:videoView];
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
    [self.viewDeckController closeLeftViewAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - test

- (void)gotoBackPage:(id)sender {
//    HLLProductListViewController *productDetailController = [[HLLProductListViewController alloc] initWithNibName:@"HLLProductListViewController" bundle:nil];
//    self.viewDeckController.centerController=productDetailController;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
