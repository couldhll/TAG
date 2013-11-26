//
//  HLLProductListViewController.m
//  TAG
//
//  Created by CouldHll on 13-9-23.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductListViewController.h"

#import "HLLProductDetailViewController.h"
#import "HLLProductUnitView.h"
#import "HLLProductFilterViewController.h"

#import <SVPullToRefresh/SVPullToRefresh.h>

#define GMGRIDVIEW_PAGE_COL_COUNT 3
#define GMGRIDVIEW_PAGE_ROW_COUNT 5
#define GMGRIDVIEW_PAGE_UNIT_COUNT (GMGRIDVIEW_PAGE_COL_COUNT*GMGRIDVIEW_PAGE_ROW_COUNT)

#define GMGRIDVIEW_SPACING 5
#define GMGRIDVIEW_SIZE CGSizeMake(100, 100)

@interface HLLProductListViewController () <UINavigationControllerDelegate, GMGridViewDataSource, GMGridViewActionDelegate, HLLProductFilterViewControllerDelegate>
{
    NSMutableArray<HLLProductModel> *models;
    
    __gm_weak GMGridView *_gmGridView;
    HLLProductFilterViewController *filterViewController;
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
//            self.edgesForExtendedLayout = UIRectEdgeNone;
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
    
    // right controller
    filterViewController = [[HLLProductFilterViewController alloc] initWithNibName:@"HLLProductFilterViewController" bundle:nil];
    filterViewController.delegate=self;
    
    // data
    models=(NSMutableArray<HLLProductModel>*)[[NSMutableArray alloc] init];
//    NSMutableArray *_data = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 15; i ++)
//    {
//        [_data addObject:[NSString stringWithFormat:@"A %d", i]];
//    }
//    _currentData=_data;
    
    // grid view
    GMGridView *gmGridView = [[GMGridView alloc] initWithFrame:self.view.bounds];
    gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    gmGridView.style = GMGridViewStylePush;
    gmGridView.itemSpacing = GMGRIDVIEW_SPACING;
    gmGridView.minEdgeInsets = UIEdgeInsetsMake(GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING);
    gmGridView.minContentSize = self.view.bounds.size;
    gmGridView.centerGrid = NO;
    gmGridView.actionDelegate = self;
    gmGridView.dataSource = self;
    gmGridView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:gmGridView];
    _gmGridView = gmGridView;
    
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
    filterViewController=nil;
    models=nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // auto refresh
    [_gmGridView triggerPullToRefresh];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // add right controller
    self.viewDeckController.rightController = filterViewController;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // remove right controller
    [self.viewDeckController closeRightViewAnimated:YES
                                         completion:^(IIViewDeckController *controller, BOOL success) {
                                             self.viewDeckController.rightController = nil;
                                         }];
}

#pragma mark - GMGridViewDataSource

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return [models count];
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
    
    // get exist cell
    GMGridViewCell *cell = [gridView dequeueReusableCell];
    
    // if no cell create one
    if (!cell)
    {
        cell = [[GMGridViewCell alloc] init];
//        cell.deleteButtonIcon = [UIImage imageNamed:@"close_x.png"];
//        cell.deleteButtonOffset = CGPointMake(-15, -15);
        
        HLLProductUnitView *unitView = [[HLLProductUnitView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        
        cell.contentView = unitView;
    }
    
    // cell
    HLLProductUnitView *productUnitView=(HLLProductUnitView *)cell.contentView;
    
    // load data
    HLLProductModel *productModel=[models objectAtIndex:index];
    if (productModel)
    {
        if (productModel.thumbnail_image_url!=nil)
        {
            [productUnitView loadImage:productModel.thumbnail_image_url.absoluteString];
        }
        [productUnitView setProductType:productModel.show_type.intValue];
    }
    
//    // nodata
//    [productUnitView loadImage:@"http://lorempixel.com/208/208/food"];
//    [productUnitView setProductType:HLLProductTypeCS];
    
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
    
    // load data
    HLLProductModel *productModel=[models objectAtIndex:position];
    
    // goto product detail view
    HLLProductDetailViewController *productDetailController = [[HLLProductDetailViewController alloc] initWithNibName:@"HLLProductDetailViewController" bundle:nil];
    productDetailController.productId=productModel.id;
    productDetailController.productType=productModel.show_type.intValue;
    [self.navigationController pushViewController:productDetailController animated:YES];
}

#pragma mark - SVPullToRefresh + SVInfiniteScrolling

- (void)PullToRefresh
{
    NSLog(@"PullToRefresh");
    
    // reload data
    [self loadDataWithPage:1
                completion:^(void){
                    [_gmGridView reloadData];
                    [_gmGridView.pullToRefreshView stopAnimating];
                }];
    
//    int64_t delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        // adding object at the first position
//        NSString *newItem = [NSString stringWithFormat:@"%d", (int)(arc4random() % 1000)];
//        [products addObject:newItem];
//        [_gmGridView insertObjectAtIndex:0 withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
//        
//        [_gmGridView.pullToRefreshView stopAnimating];
//    });
}

- (void)InfiniteScrolling
{
    NSLog(@"InfiniteScrolling");
    
    // add data
    [self loadDataWithPage:[self pageWithData:models]+1
                completion:^(void){
                    [_gmGridView reloadData];
                    [_gmGridView.infiniteScrollingView stopAnimating];
                }];
    
//    int64_t delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        // adding object at the last position
//        NSString *newItem = [NSString stringWithFormat:@"%d", (int)(arc4random() % 1000)];
//        [products addObject:newItem];
//        [_gmGridView insertObjectAtIndex:[products count] - 1 withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
//        
//        [_gmGridView.infiniteScrollingView stopAnimating];
//    });
}

#pragma mark - HLLProductFilterViewControllerDelegate

- (void)productFilterViewController:(HLLProductFilterViewController*)productFilterViewController filter:(NSMutableArray*)filter keyword:(NSString*)keyword
{
    [_gmGridView triggerPullToRefresh];
}

#pragma mark - Data

- (void)loadDataWithPage:(int)page completion:(void (^)(void))completeBlock
{
    NSLog(@"load data at page %d", page);
    
    int startIndex=(page-1)*GMGRIDVIEW_PAGE_UNIT_COUNT;
    
    [HLLDataJson productGetList:self.view
                              count:[NSString stringWithFormat:@"%d",GMGRIDVIEW_PAGE_UNIT_COUNT]
                               page:[NSString stringWithFormat:@"%d",page]
                       searchOption:[filterViewController.filterArray componentsJoinedByString:@","]
                      searchKeyword:filterViewController.searchText
                         completion:nil
                            success:^(id json, JSONModelError *err) {
                                HLLProductListModel* productListModel = [[HLLProductListModel alloc] initWithDictionary:json error:nil];
                                if (productListModel)
                                {
                                    NSMutableArray<HLLProductModel>* productModelArray=(NSMutableArray<HLLProductModel>*)[NSMutableArray arrayWithArray:productListModel.products];
                                    
                                    // first page to clear all data
                                    if (page==1)
                                    {
                                        // clear data
                                        [models removeAllObjects];
                                    }
                                    
                                    // add data
                                    [self replaceData:productModelArray index:startIndex];
                                }
                                
                                completeBlock();
                            }
                              error:nil];
}

- (void)replaceData:(NSArray*)data index:(int)index
{
    // add data length
    for (int i=models.count; i<index+data.count; i++)
    {
        [models addObject:[NSNull null]];
    }
    
    // update data
    [models replaceObjectsInRange:NSMakeRange(index,data.count) withObjectsFromArray:data];
}

- (int)pageWithData:(NSArray*)data
{
    int page=data.count/GMGRIDVIEW_PAGE_UNIT_COUNT;
    return page;
}

@end
