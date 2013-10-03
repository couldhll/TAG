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
    
    self.title = @"Product List";
    
//    // navigation bar
//    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:
//                                              [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"MenuTitle",nil) style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)],
//                                              nil];
    
    //设置导航栏背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_background.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    //导航栏正中央图片
    UIImage * titleImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_logo.png"];
    UIImageView * titleview = [[UIImageView alloc]initWithImage:titleImage];
    //加在导航栏中
    self.navigationItem.titleView =titleview;
    
    //绘制导航栏右侧的图片按钮
    UIImage *rightButtonImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_button.png"];
    UIImage *rightbuttonNormal = [rightButtonImage
                                  stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    
    //设置按钮类型为自定义
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置按钮的显示区域
    [rightButton setFrame: CGRectMake(0, 0, 50, 40)];
    //设置按钮的背景显示图
    [rightButton setBackgroundImage:rightbuttonNormal forState:UIControlStateNormal];
    //设置按钮的前景显示图
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/navigation_friends_icon.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/navigation_friends_icon.png"] forState:UIControlStateHighlighted];
    //监听点击事件
    [rightButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchDown];
    //加载导航栏中
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    
    
    //含义和上面类似就不详解了
    //绘制导航栏左侧的图片按钮
    UIImage *leftButtonImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_button.png"];
    UIImage *leftbuttonNormal = [leftButtonImage
                                 stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftButton setFrame: CGRectMake(0, 0, 50, 40)];
    
    [leftButton setBackgroundImage:leftbuttonNormal forState:UIControlStateNormal];
    
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/navigation_menu_icon.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/navigation_menu_icon.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    
    
    
    
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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.viewDeckController closeLeftViewAnimated:YES];
    [_gmGridView triggerPullToRefresh];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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
    
    [(HLLProductUnitView *)cell.contentView loadImage:@"http://test.tagoriginals.com/images/TAG-Appshouye_05.jpg"];
    
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
    //    self.viewDeckController.centerController=productDetailController;
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
