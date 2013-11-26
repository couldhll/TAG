//
//  HLLTOBrandProductViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTOBrandProductViewController.h"

#import "HLLProductDetailViewController.h"

#define BRAND_TITLE_STRING @"More From"

#define GMGRIDVIEW_PAGE_COL_COUNT 4
#define GMGRIDVIEW_PAGE_ROW_COUNT 1
#define GMGRIDVIEW_PAGE_UNIT_COUNT (GMGRIDVIEW_PAGE_COL_COUNT*GMGRIDVIEW_PAGE_ROW_COUNT)

#define GMGRIDVIEW_SPACING 5
#define GMGRIDVIEW_SIZE CGSizeMake(60, 60)

@interface HLLTOBrandProductViewController () <GMGridViewDataSource, GMGridViewActionDelegate>

@end

@implementation HLLTOBrandProductViewController

@synthesize brandName;
@synthesize brandProducts;

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
    self.productGMGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.productGMGridView.style = GMGridViewStylePush;
    self.productGMGridView.itemSpacing = GMGRIDVIEW_SPACING;
    self.productGMGridView.minEdgeInsets = UIEdgeInsetsMake(GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING, GMGRIDVIEW_SPACING);
    self.productGMGridView.minContentSize = self.productGMGridView.frame.size;
    self.productGMGridView.centerGrid = NO;
    self.productGMGridView.actionDelegate = self;
    self.productGMGridView.dataSource = self;
    self.productGMGridView.backgroundColor = [UIColor clearColor];
    self.productGMGridView.layoutStrategy = [GMGridViewLayoutStrategyFactory strategyFromType:GMGridViewLayoutHorizontalPagedLTR];
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

- (void)setBrandName:(NSString*)name
{
    brandName=name;
    [self updateBrandTitleLabel];
}

- (void)setBrandProducts:(NSArray<HLLProductModel>*)products
{
    brandProducts=products;
    
    // update brand products
    [self.productGMGridView reloadData];
}

#pragma mark - Private Methods

- (void)updateBrandTitleLabel
{
    if (brandName==nil)
    {
        return;
    }
    
    // brand title
    NSString *brandTitleString=[NSString stringWithFormat:@"%@ %@",BRAND_TITLE_STRING,brandName];
    NSMutableAttributedString* brandTitleAttributedString = [NSMutableAttributedString attributedStringWithString:brandTitleString];
    [brandTitleAttributedString setFont:[UIFont fontWithFont:[UIFont fontWithName:APPLICATION_FONT_NAME size:14] style:UIFONT_LIGHT]];
    [brandTitleAttributedString setTextColor:APPLICATION_COLOR_GREY];
    
    // brandName color
    NSRange brandNameRange=NSMakeRange(brandTitleAttributedString.length-brandName.length-1,brandName.length);
    [brandTitleAttributedString setTextColor:APPLICATION_COLOR_BLUE range:brandNameRange];
    
    // brand title label
    self.brandTitleLabel.attributedText=brandTitleAttributedString;
}

#pragma mark - GMGridViewDataSource

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return [brandProducts count];
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
        
        UIImageView *unitView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        
        cell.contentView = unitView;
    }
    
    // cell
    UIImageView *productUnitView=(UIImageView *)cell.contentView;
    
    // load data
    HLLProductModel *productModel=[brandProducts objectAtIndex:index];
    if (productModel)
    {
        if (productModel.thumbnail_image_url!=nil)
        {
            [productUnitView setImageWithURL:productModel.thumbnail_image_url placeholderImage:APPLICATION_IMAGE_LOADING_PRODUCT_UIIMAGE];
        }
    }
    
    return cell;
}


- (BOOL)GMGridView:(GMGridView *)gridView canDeleteItemAtIndex:(NSInteger)index
{
    return NO;
}

#pragma mark - GMGridViewActionDelegate

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    // load data
    HLLProductModel *productModel=[brandProducts objectAtIndex:position];
    
    // delegate
    if([self.delegate respondsToSelector:@selector(viewController:select:)])
    {
        [self.delegate viewController:self select:productModel];
    }
}

@end
