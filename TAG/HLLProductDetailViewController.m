//
//  HLLProductDetailViewController.m
//  TAG
//
//  Created by CouldHll on 13-9-23.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductDetailViewController.h"

#import "HLLTOTitleViewController.h"
#import "HLLCSTitleViewController.h"
#import "HLLProductImageViewController.h"
#import "HLLProductBuyViewController.h"
#import "HLLTOPriceViewController.h"
#import "HLLCSPriceViewController.h"
#import "HLLCSBrandViewController.h"
#import "HLLCSUserViewController.h"
#import "HLLCSVideoViewController.h"
#import "HLLCSInformationViewController.h"
#import "HLLTOBrandProductViewController.h"
#import "HLLProductCommentViewController.h"

#import "HLLProductFavoriteViewController.h"

#import <ShareSDK/ShareSDK.h>

@interface HLLProductDetailViewController () <UINavigationControllerDelegate,HLLProductBuyViewControllerDelegate,HLLProductBrandProductViewControllerDelegate,HLLProductCommentViewControllerDelegate>
{
    HLLProductModel *model;
    NSMutableArray<HLLCommentModel> *commentModels;
    
    UIScrollView *containView;
    NSMutableArray *subControllers;
    
    UIViewController *titleViewController;
    HLLProductImageViewController *imageViewController;
    HLLProductBuyViewController *buyViewController;
    UIViewController *priceViewController;
    UIViewController *brandViewController;
    UIViewController *userViewController;
    UIViewController *videoViewController;
    UIViewController *informationViewController;
    UIViewController *brandProductViewController;
    HLLProductCommentViewController *commentViewController;
}

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
    
    // load data
    [HLLDataJson productGetInfo:nil
                      productId:[NSString stringWithFormat:@"%d",self.productId]
                     completion:nil
                        success:^(id json, JSONModelError *err) {
                            HLLProductModel* productModel = [[HLLProductModel alloc] initWithDictionary:json error:nil];
                            if (productModel)
                            {
                                model=productModel;
                                
                                // load sub view
                                [self subViewsLoadData:model];
                            }
                        }
                          error:nil];
    
    // load data
    [HLLDataJson commentGetList:nil
                      productId:[NSString stringWithFormat:@"%d",self.productId]
                          count:nil
                           page:nil
                     completion:nil
                        success:^(id json, JSONModelError *err) {
                            HLLCommentListModel* commentListModel = [[HLLCommentListModel alloc] initWithDictionary:json error:nil];
                            if (commentListModel)
                            {
                                commentModels=(NSMutableArray<HLLCommentModel>*)commentListModel.comments;
                                
                                // load comment view
                                [self commentViewLoadData:commentModels];
                            }
                        }
                          error:nil];
    
    // navigation left button
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Common/arrow_blue_icon.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Common/arrow_blue_icon.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [leftButton sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    // navigation right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/share_icon.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/share_icon.png"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchDown];
    [rightButton sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    // init contain view
    containView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    containView.canCancelContentTouches=NO;
    [self.view addSubview:containView];
    
    // init sub view
    [self subViewsAddToParent:containView];
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

#pragma mark - Actions


#pragma mark - Sub View

- (void)subViewsAddToParent:(UIView*)parentView
{
    // init sub view
    subControllers=[[NSMutableArray alloc] init];
    
    // title view
    if (self.productType==HLLProductTypeCS)
    {
        titleViewController = [[HLLCSTitleViewController alloc] initWithNibName:@"HLLCSTitleViewController" bundle:nil];
    }
    else
    {
        titleViewController = [[HLLTOTitleViewController alloc] initWithNibName:@"HLLTOTitleViewController" bundle:nil];
    }
    [subControllers addObject:titleViewController];
    
    // image view
    imageViewController = [[HLLProductImageViewController alloc] initWithNibName:@"HLLProductImageViewController" bundle:nil];
    [subControllers addObject:imageViewController];
    
    // buy view
    buyViewController = [[HLLProductBuyViewController alloc] initWithNibName:@"HLLProductBuyViewController" bundle:nil];
    buyViewController.productType=self.productType;
    buyViewController.delegate=self;
    [subControllers addObject:buyViewController];
    
    // price view
    if (self.productType==HLLProductTypeCS)
    {
        priceViewController = [[HLLCSPriceViewController alloc] initWithNibName:@"HLLCSPriceViewController" bundle:nil];
    }
    else
    {
        priceViewController = [[HLLTOPriceViewController alloc] initWithNibName:@"HLLTOPriceViewController" bundle:nil];
    }
    [subControllers addObject:priceViewController];
    
    // brand view
    if (self.productType==HLLProductTypeCS)
    {
        brandViewController = [[HLLCSBrandViewController alloc] initWithNibName:@"HLLCSBrandViewController" bundle:nil];
        [subControllers addObject:brandViewController];
    }
    else
    {
        
    }
    
    // user view
    if (self.productType==HLLProductTypeCS)
    {
        userViewController = [[HLLCSUserViewController alloc] initWithNibName:@"HLLCSUserViewController" bundle:nil];
        [subControllers addObject:userViewController];
    }
    else
    {
        
    }
    
    // video view
    if (self.productType==HLLProductTypeCS)
    {
        videoViewController = [[HLLCSVideoViewController alloc] initWithNibName:@"HLLCSVideoViewController" bundle:nil];
        [subControllers addObject:videoViewController];
    }
    else
    {
        
    }
    
    // information view
    if (self.productType==HLLProductTypeCS)
    {
        informationViewController = [[HLLCSInformationViewController alloc] initWithNibName:@"HLLCSInformationViewController" bundle:nil];
        [subControllers addObject:informationViewController];
    }
    else
    {
        
    }
    
    // brand product view
    if (self.productType==HLLProductTypeCS)
    {
        
    }
    else
    {
        HLLTOBrandProductViewController *toBrandProductViewController = [[HLLTOBrandProductViewController alloc] initWithNibName:@"HLLTOBrandProductViewController" bundle:nil];
        toBrandProductViewController.delegate=self;
        
        brandProductViewController=toBrandProductViewController;
        [subControllers addObject:brandProductViewController];
    }
    
    // comment view
    commentViewController = [[HLLProductCommentViewController alloc] initWithNibName:@"HLLProductCommentViewController" bundle:nil];
    commentViewController.delegate=self;
    [subControllers addObject:commentViewController];
    
    // add sub view
    for (UIViewController *viewController in subControllers)
    {
        [parentView addSubview:viewController.view];
    }
    
    // position sub view
    [self subViewsResetPosition];
}

- (void)subViewsLoadData:(HLLProductModel*)productModel
{
    // title view
    if (self.productType==HLLProductTypeCS)
    {
        HLLCSTitleViewController *csTitleViewController=(HLLCSTitleViewController*)titleViewController;
        csTitleViewController.productName=model.name;
        csTitleViewController.brandName=model.brand.name;
        csTitleViewController.userName=model.user.name;
    }
    else
    {
        HLLTOTitleViewController *toTitleViewController=(HLLTOTitleViewController*)titleViewController;
        toTitleViewController.brandImageUrl=model.brand.thumbnail_image_url;
        toTitleViewController.brandName=model.brand.name;
        toTitleViewController.productTime=model.created_at;
    }
    
    // image view
    imageViewController.productImageUrl=model.middle_image_url;
    
    // buy view
    if (self.productType==HLLProductTypeCS)
    {
//        buyViewController = [[HLLCSBuyViewController alloc] initWithNibName:@"HLLCSBuyViewController" bundle:nil];
    }
    else
    {
//        buyViewController = [[HLLTOBuyViewController alloc] initWithNibName:@"HLLTOBuyViewController" bundle:nil];
    }
    
    // price view
    if (self.productType==HLLProductTypeCS)
    {
        HLLCSPriceViewController *csPriceViewController=(HLLCSPriceViewController*)priceViewController;
        csPriceViewController.currencyModel=[HLLCurrencyModel getUsdCurrency];
        csPriceViewController.priceUsd=model.price_usd.floatValue;
        csPriceViewController.endTime=model.end_time;
        csPriceViewController.favoriteCount=[model.favorited_count intValue];
        csPriceViewController.subscribeCount=[model.subscribe_count intValue];
        csPriceViewController.subscribeLevel=[model.subscribe_level intValue];
    }
    else
    {
        HLLTOPriceViewController *toPriceViewController=(HLLTOPriceViewController*)priceViewController;
        toPriceViewController.currencyModel=[HLLCurrencyModel getUsdCurrency];
        toPriceViewController.priceUsd=model.price_usd.floatValue;
    }
    
    // brand view
    if (self.productType==HLLProductTypeCS)
    {
        HLLCSBrandViewController *csBrandViewController=(HLLCSBrandViewController*)brandViewController;
        csBrandViewController.brandImageUrl=model.brand.middle_image_url;
        csBrandViewController.brandFollowed=[model.brand.followed boolValue];
        csBrandViewController.brandName=model.brand.name;
        csBrandViewController.brandDescription=model.brand.description;
        csBrandViewController.brandLinks=model.brand.links;
        csBrandViewController.brandId=model.brand.id;
    }
    else
    {
        
    }
    
    // user view
    if (self.productType==HLLProductTypeCS)
    {
        HLLCSUserViewController *csUserViewController=(HLLCSUserViewController*)userViewController;
        csUserViewController.userImageUrl=model.user.middle_image_url;
        csUserViewController.userFollowed=[model.user.followed boolValue];
        csUserViewController.userName=model.user.name;
        csUserViewController.userDescription=model.user.description;
        csUserViewController.productSuccessRate=[model.user.product_success_rate floatValue];
        csUserViewController.productFavoritedCount=[model.user.product_favorited_count intValue];
        csUserViewController.userId=model.user.id;
    }
    else
    {
        
    }
    
    // video view
    if (self.productType==HLLProductTypeCS)
    {
        HLLCSVideoViewController *csVideoViewController=(HLLCSVideoViewController*)videoViewController;
        csVideoViewController.videoUrls=model.video_urls;
    }
    else
    {
        
    }
    
    // information view
    if (self.productType==HLLProductTypeCS)
    {
        HLLCSInformationViewController *csInformationViewController=(HLLCSInformationViewController*)informationViewController;
        csInformationViewController.productInformation=model.information;
    }
    else
    {
        
    }
    
    // brand product view
    if (self.productType==HLLProductTypeCS)
    {
        
    }
    else
    {
        HLLTOBrandProductViewController *toBrandProductViewController=(HLLTOBrandProductViewController*)brandProductViewController;
        toBrandProductViewController.brandName=model.brand.name;
        toBrandProductViewController.brandProducts=model.brand.products;
    }
    
    // set sub view position
    [self subViewsResetPosition];
}

- (void)subViewsResetPosition
{
    float containViewHeight = 0.0f;
    for (UIViewController *viewController in subControllers)
    {
        UIView *view=viewController.view;
        
        // position
        [view setFrame:CGRectMake(view.frame.origin.x, containViewHeight, view.frame.size.width, view.frame.size.height)];
        
        // front
        if ([viewController isMemberOfClass:HLLCSPriceViewController.class]||[viewController isMemberOfClass:HLLTOPriceViewController.class])
        {
            [containView bringSubviewToFront:view];
        }
        
        containViewHeight += view.frame.size.height;
    }
    
    // all height
    [containView setContentSize:(CGSizeMake(containView.frame.size.width, containViewHeight))];
}

- (void)commentViewLoadData:(NSArray<HLLCommentModel>*)aCommentModels
{
    // comment view
    commentViewController.productComments=aCommentModels;
}

#pragma mark - Share

- (void)share
{
    // share content
    id<ISSContent> publishContent = [ShareSDK content:[NSString stringWithFormat:@"分享%@",model.name]
                                       defaultContent:[NSString stringWithFormat:@"默认分享内容，没内容时显示,%@",model.name]
                                                image:[ShareSDK imageWithUrl:model.middle_image_url.absoluteString]
                                                title:@"TAG ORIGINALS"
                                                  url:model.buy_url.absoluteString
                                          description:model.information
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

#pragma mark - HLLProductBuyViewControllerDelegate

- (void)viewController:(UIViewController *)viewController save:(UIButton *)button
{
    // popup product favorite view
    HLLProductFavoriteViewController *productFavoriteViewController = [[HLLProductFavoriteViewController alloc] initWithNibName:@"HLLProductFavoriteViewController" bundle:nil];
    [self presentFormSheetWithViewController:productFavoriteViewController animated:YES completionHandler:nil];
}

- (void)viewController:(UIViewController *)viewController buy:(UIButton *)button
{
    [[UIApplication sharedApplication] openURL:model.buy_url];
}

#pragma mark - HLLProductBuyViewControllerDelegate

- (void)viewController:(UIViewController *)viewController select:(HLLProductModel *)productModel
{
    if (productModel!=nil)
    {
        // goto select product detail view
        HLLProductDetailViewController *productDetailController = [[HLLProductDetailViewController alloc] initWithNibName:@"HLLProductDetailViewController" bundle:nil];
        productDetailController.productId=productModel.id;
        productDetailController.productType=productModel.show_type.intValue;
        [self.navigationController pushViewController:productDetailController animated:YES];
    }
}

#pragma mark - HLLProductCommentViewControllerDelegate

- (void)viewController:(UIViewController *)viewController addComment:(NSString *)comment
{
    if (comment!=nil)
    {
        // add comment
        [HLLDataAuthorizeProvider commentAdd:nil
                                   productId:[NSString stringWithFormat:@"%d",self.productId]
                                     comment:comment
                                  completion:nil
                                     success:^(id json, JSONModelError *err) {
                                         HLLCommentModel* commentModel = [[HLLCommentModel alloc] initWithDictionary:json error:nil];
                                         if (commentModel)
                                         {
                                             // get comment info
                                             commentModel.comment=comment;
                                             commentModel.user=(HLLUserModel<Optional,ConvertOnDemand>*)[[HLLUserData sharedInstance] authorizationUser];
                                             
                                             // add new model
                                             NSMutableArray<HLLCommentModel> *newCommentModels=(NSMutableArray<HLLCommentModel>*)[[NSMutableArray alloc] init];
                                             [newCommentModels addObject:commentModel];
                                             [newCommentModels addObjectsFromArray:commentModels];
                                             commentModels=newCommentModels;
                                             
                                             // load comment view
                                             [self commentViewLoadData:commentModels];
                                         }
                                     }
                                       error:nil];
    }
}

#pragma mark - test

- (void)gotoBackPage:(id)sender {
//    HLLProductListViewController *productDetailController = [[HLLProductListViewController alloc] initWithNibName:@"HLLProductListViewController" bundle:nil];
//    self.viewDeckController.centerController=productDetailController;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
