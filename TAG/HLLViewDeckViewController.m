//
//  HLLViewDeckViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-10.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLViewDeckViewController.h"

#import "IIViewDeckController.h"
#import <OHAttributedLabel/OHAttributedLabel.h>

@interface HLLViewDeckViewController ()

@end

@implementation HLLViewDeckViewController

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
    
    // view deck
    self.viewDeckController.leftSize=58;
    self.viewDeckController.rightSize=58;
    
    // navigation center title
    NSMutableAttributedString* titleString = [NSMutableAttributedString attributedStringWithString:@"TAG ORIGINALS"];
    [titleString setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [titleString setTextColor:HexRGB(0x174C9C)];
    [titleString setTextBold:YES range:NSMakeRange(0,3)];// "TAG" blod
    OHAttributedLabel *titleLabel=[[OHAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    titleLabel.attributedText=titleString;
    self.navigationItem.titleView=titleLabel;
    
    // navigation left button background image
    //    UIImage *leftButtonBackgroundImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_button.png"];
    //    UIImage *leftbuttonBackground9patchImage = [leftButtonBackgroundImage stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    // navigation left button
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame: CGRectMake(0, 0, 60, 60)];
    //    [leftButton setBackgroundImage:leftbuttonBackground9patchImage forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_icon.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_icon.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    // navigation right button background image
    //    UIImage *rightButtonBackgroundImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_button.png"];
    //    UIImage *rightbuttonBackground9patchImage = [rightButtonBackgroundImage stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    // navigation right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame: CGRectMake(0, 0, 60, 60)];
    //    [rightButton setBackgroundImage:rightbuttonBackground9patchImage forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/filter_icon.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/filter_icon.png"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self.viewDeckController action:@selector(toggleRightView) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
//    [self prefersStatusBarHidden];
//    [self setNeedsStatusBarAppearanceUpdate];
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

#pragma mark - Status bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}


@end
