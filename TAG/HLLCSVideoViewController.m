//
//  HLLCSVideoViewController.m
//  TAG
//
//  Created by CouldHll on 13-12-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCSVideoViewController.h"

#define GMGRIDVIEW_PAGE_COL_COUNT 2
#define GMGRIDVIEW_PAGE_ROW_COUNT 1
#define GMGRIDVIEW_PAGE_UNIT_COUNT (GMGRIDVIEW_PAGE_COL_COUNT*GMGRIDVIEW_PAGE_ROW_COUNT)

#define GMGRIDVIEW_SPACING 7
#define GMGRIDVIEW_SIZE CGSizeMake(146, 84)

@interface HLLCSVideoViewController () <GMGridViewDataSource>

@end

@implementation HLLCSVideoViewController

@synthesize videoUrls;

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
    
    // grid view
    self.videoGMGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.videoGMGridView.style = GMGridViewStylePush;
    self.videoGMGridView.itemSpacing = GMGRIDVIEW_SPACING;
    self.videoGMGridView.minEdgeInsets = UIEdgeInsetsMake(GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING);
    self.videoGMGridView.minContentSize = self.videoGMGridView.frame.size;
    self.videoGMGridView.centerGrid = NO;
//    self.videoGMGridView.actionDelegate = self;
    self.videoGMGridView.dataSource = self;
    self.videoGMGridView.backgroundColor = [UIColor clearColor];
    self.videoGMGridView.layoutStrategy = [GMGridViewLayoutStrategyFactory strategyFromType:GMGridViewLayoutHorizontalPagedLTR];
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

#pragma mark - Property

- (void)setVideoUrls:(NSArray*)urls
{
    videoUrls=urls;
    
    // update video urls
    [self.videoGMGridView reloadData];
}

#pragma mark - Private Methods

#pragma mark - GMGridViewDataSource

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return [videoUrls count];
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
        
        HLLVideoView *unitView = [[HLLVideoView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        
        cell.contentView = unitView;
    }
    
    // cell
    HLLVideoView *videoUnitView=(HLLVideoView *)cell.contentView;
    
    // load data
    NSString *videoUrl=[videoUrls objectAtIndex:index];
    if (videoUrl)
    {
        [videoUnitView loadVideo:videoUrl];
    }
    
    return cell;
}

@end
