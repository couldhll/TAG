//
//  HLLViewDeckViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-10.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLViewDeckViewController.h"

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
    
    // navigation left button
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_icon.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_icon.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchDown];
    [leftButton sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    // navigation right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_product_icon.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_product_icon.png"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(gotoProductList:) forControlEvents:UIControlEventTouchDown];
    [rightButton sizeToFit];
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

#pragma mark - Private Methods

- (void)gotoProductList:(id)sender
{
    [AppDelegate openViewController:@"HLLProductListViewController" sender:self];
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
