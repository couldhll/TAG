//
//  HLLViewDeckViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-10.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLViewDeckViewController.h"

#import <ViewDeck/IIViewDeckController.h>
#import <OHAttributedLabel/OHAttributedLabel.h>

@interface HLLViewDeckViewController () <IIViewDeckControllerDelegate>

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
    self.viewDeckController.rightSize=48;
    self.viewDeckController.delegate=self;
    
    // navigation center title
    NSMutableAttributedString* titleString = [NSMutableAttributedString attributedStringWithString:@"TAG ORIGINALS"];
    [titleString setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [titleString setTextColor:APPLICATION_COLOR_BLUE];
    [titleString setTextBold:YES range:NSMakeRange(0,3)];// "TAG" blod
    OHAttributedLabel *titleLabel=[[OHAttributedLabel alloc] init];
    titleLabel.backgroundColor=APPLICATION_COLOR_YELLOW;
    titleLabel.attributedText=titleString;
    [titleLabel sizeToFit];
    self.navigationItem.titleView=titleLabel;
    
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

#pragma mark - view deck

//- (void)viewDeckController:(IIViewDeckController *)viewDeckController applyShadow:(CALayer *)shadowLayer withBounds:(CGRect)rect
//{
//    shadowLayer.masksToBounds = NO;
//    shadowLayer.shadowRadius = 5;
//    shadowLayer.shadowOpacity = 0.9;
//    shadowLayer.shadowColor = [[UIColor redColor] CGColor];
//    shadowLayer.shadowOffset = CGSizeZero;
//    shadowLayer.shadowPath = [[UIBezierPath bezierPathWithRect:rect] CGPath];
//}

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
