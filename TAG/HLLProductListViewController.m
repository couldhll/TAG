//
//  HLLProductListViewController.m
//  TAG
//
//  Created by CouldHll on 13-9-23.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductListViewController.h"

#import "IIViewDeckController.h"
#import "GMGridView.h"
#import "SVPullToRefresh.h"

#import "HLLProductDetailViewController.h"
#import "HLLProductUnitView.h"
#import "HLLProductFilterViewController.h"

#define GMGRIDVIEW_SPACING 5
#define GMGRIDVIEW_SIZE CGSizeMake(100, 100)

@interface HLLProductListViewController () <UINavigationControllerDelegate, GMGridViewDataSource, GMGridViewActionDelegate>
{
    __gm_weak GMGridView *_gmGridView;
//    __gm_weak NSMutableArray *_currentData;
    NSMutableArray *_currentData;
}

@end

@implementation HLLProductListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // for iOS7 SVPullToRefresh
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
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
    
    // navigation left button background image
    //    UIImage *leftButtonBackgroundImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_button.png"];
    //    UIImage *leftbuttonBackground9patchImage = [leftButtonBackgroundImage stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    // navigation left button
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftButton setFrame: CGRectMake(0, 0, 60, 60)];
    //    [leftButton setBackgroundImage:leftbuttonBackground9patchImage forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_icon.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/menu_icon.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchDown];
    [leftButton sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    // navigation right button background image
    //    UIImage *rightButtonBackgroundImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_button.png"];
    //    UIImage *rightbuttonBackground9patchImage = [rightButtonBackgroundImage stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    // navigation right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightButton setFrame: CGRectMake(0, 0, 60, 60)];
    //    [rightButton setBackgroundImage:rightbuttonBackground9patchImage forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/filter_icon.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/filter_icon.png"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self.viewDeckController action:@selector(toggleRightView) forControlEvents:UIControlEventTouchDown];
    [rightButton sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    // data
    NSMutableArray *_data = [[NSMutableArray alloc] init];
    for (int i = 0; i < 15; i ++)
    {
        [_data addObject:[NSString stringWithFormat:@"A %d", i]];
    }
    _currentData=_data;
    
    // grid view
    GMGridView *gmGridView = [[GMGridView alloc] initWithFrame:self.view.bounds];
    gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    gmGridView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:gmGridView];
    _gmGridView = gmGridView;
    
    _gmGridView.style = GMGridViewStylePush;
    _gmGridView.itemSpacing = GMGRIDVIEW_SPACING;
    _gmGridView.minEdgeInsets = UIEdgeInsetsMake(GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING);
    _gmGridView.centerGrid = YES;
    _gmGridView.actionDelegate = self;
    _gmGridView.dataSource = self;
    
    // PullToRefresh + InfiniteScrolling
//    _gmGridView.showsPullToRefresh = NO;
//    _gmGridView.showsInfiniteScrolling = NO;
    [_gmGridView addPullToRefreshWithActionHandler:^{// setup pull-to-refresh
        [self PullToRefresh];
    }];
    [_gmGridView addInfiniteScrollingWithActionHandler:^{// setup infinite scrolling
        [self InfiniteScrolling];
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _gmGridView=nil;
    _currentData=nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // create right controller
    UIViewController* rightController = [[HLLProductFilterViewController alloc] initWithNibName:@"HLLProductFilterViewController" bundle:nil];
    self.viewDeckController.rightController = rightController;
    
    // auto refresh
    [_gmGridView triggerPullToRefresh];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // close right controller
    [self.viewDeckController closeRightViewAnimated:YES completion:^(IIViewDeckController *controller, BOOL success) {self.viewDeckController.rightController = nil;}];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - GMGridViewDataSource

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return [_currentData count];
}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)// iphone
    {
        if (UIInterfaceOrientationIsLandscape(orientation))//Landscape
        {
            return GMGRIDVIEW_SIZE;
        }
        else
        {
            return GMGRIDVIEW_SIZE;
        }
    }
    else// ipad
    {
        if (UIInterfaceOrientationIsLandscape(orientation))//Landscape
        {
            return GMGRIDVIEW_SIZE;
        }
        else
        {
            return GMGRIDVIEW_SIZE;
        }
    }
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    //NSLog(@"Creating view indx %d", index);
    
    CGSize size = [self GMGridView:gridView sizeForItemsInInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    
    GMGridViewCell *cell = [gridView dequeueReusableCell];
    
    if (!cell)
    {
        cell = [[GMGridViewCell alloc] init];
//        cell.deleteButtonIcon = [UIImage imageNamed:@"close_x.png"];
//        cell.deleteButtonOffset = CGPointMake(-15, -15);
        
        HLLProductUnitView *unitView = [[HLLProductUnitView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        
        cell.contentView = unitView;
    }
    
    HLLProductUnitView *productUnitView=(HLLProductUnitView *)cell.contentView;
    [productUnitView loadImage:@"http://lorempixel.com/208/208/food"];
//    [productUnitView loadImage:@"http://test.tagoriginals.com/images/TAG-Appshouye_05.jpg"];
    [productUnitView setProductType:HLLProductTypeCS];
    
//    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
//    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    label.text = (NSString *)[_currentData objectAtIndex:index];
//    label.textAlignment = UITextAlignmentCenter;
//    label.backgroundColor = [UIColor clearColor];
//    label.textColor = [UIColor blackColor];
//    label.highlightedTextColor = [UIColor whiteColor];
//    label.font = [UIFont boldSystemFontOfSize:20];
//    [cell.contentView addSubview:label];
    
    return cell;
}


- (BOOL)GMGridView:(GMGridView *)gridView canDeleteItemAtIndex:(NSInteger)index
{
    return NO;
}

#pragma mark - GMGridViewActionDelegate

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    NSLog(@"Did tap at index %d", position);
    
    // goto product detail view
    HLLProductDetailViewController *productDetailController = [[HLLProductDetailViewController alloc] initWithNibName:@"HLLProductDetailViewController" bundle:nil];
    [self.navigationController pushViewController:productDetailController animated:YES];
}

- (void)GMGridViewDidTapOnEmptySpace:(GMGridView *)gridView
{
    NSLog(@"Tap on empty space");
}

#pragma mark - SVPullToRefresh + SVInfiniteScrolling

- (void)PullToRefresh {
    NSLog(@"PullToRefresh");
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // adding object at the first position
        NSString *newItem = [NSString stringWithFormat:@"%d", (int)(arc4random() % 1000)];
        [_currentData addObject:newItem];
        [_gmGridView insertObjectAtIndex:0 withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
        
        [_gmGridView.pullToRefreshView stopAnimating];
    });
}

- (void)InfiniteScrolling {
    NSLog(@"InfiniteScrolling");
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // adding object at the last position
        NSString *newItem = [NSString stringWithFormat:@"%d", (int)(arc4random() % 1000)];
        [_currentData addObject:newItem];
        [_gmGridView insertObjectAtIndex:[_currentData count] - 1 withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
        
        [_gmGridView.infiniteScrollingView stopAnimating];
    });
}

#pragma mark - test

- (void)addMoreItem
{
    // Example: adding object at the last position
    NSString *newItem = [NSString stringWithFormat:@"%d", (int)(arc4random() % 1000)];
    
    [_currentData addObject:newItem];
    [_gmGridView insertObjectAtIndex:[_currentData count] - 1 withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
}

- (void)removeItem
{
    // Example: removing last item
    if ([_currentData count] > 0)
    {
        NSInteger index = [_currentData count] - 1;
        
        [_gmGridView removeObjectAtIndex:index withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
        [_currentData removeObjectAtIndex:index];
    }
}

- (void)refreshItem
{
    // Example: reloading last item
    if ([_currentData count] > 0)
    {
        int index = [_currentData count] - 1;
        
        NSString *newMessage = [NSString stringWithFormat:@"%d", (arc4random() % 1000)];
        
        [_currentData replaceObjectAtIndex:index withObject:newMessage];
        [_gmGridView reloadObjectAtIndex:index withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
    }
}

@end
