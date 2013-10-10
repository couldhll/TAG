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
#import "HLLAPI.h"

#import <ShareSDK/ShareSDK.h>

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
    
    
    // navigation right button background image
    UIImage *rightButtonBackgroundImage = [UIImage imageNamed:@"Resource/Frame/Navigation/navigation_bar_button.png"];
    UIImage *rightbuttonBackground9patchImage = [rightButtonBackgroundImage stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    // navigation right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame: CGRectMake(0, 0, 50, 40)];
    [rightButton setBackgroundImage:rightbuttonBackground9patchImage forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/navigation_friends_icon.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Frame/Navigation/navigation_friends_icon.png"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    
    
    // add video view
    CGSize videoViewSize=VIDEOVIEW_SIZE;
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

- (IBAction)saveButtonPressed:(id)sender
{
    [self save];
}

#pragma mark - Share

- (void)share
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    
    // share content
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"这是一条测试信息"
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

#pragma mark - Save

- (void)save
{
    [[HLLAPI sharedInstance] save:self];
}

#pragma mark - test

- (void)gotoBackPage:(id)sender {
//    HLLProductListViewController *productDetailController = [[HLLProductListViewController alloc] initWithNibName:@"HLLProductListViewController" bundle:nil];
//    self.viewDeckController.centerController=productDetailController;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
