//
//  HLLUserLoginViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserLoginViewController.h"

#import "HLLTAGLoginViewController.h"
#import "HLLUserRegisterViewController.h"

#import <ShareSDK/ShareSDK.h>

@interface HLLUserLoginViewController ()

@end

@implementation HLLUserLoginViewController

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
    
    // hide navigation bar
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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

- (IBAction)exitButtonPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)tagRegisterButtonPressed:(id)sender
{
    HLLUserRegisterViewController *userRegisterViewController = [[HLLUserRegisterViewController alloc] initWithNibName:@"HLLUserRegisterViewController" bundle:nil];
    [self.navigationController pushViewController:userRegisterViewController animated:YES];
}

- (IBAction)tagLoginButtonPressed:(id)sender
{
    HLLTAGLoginViewController *tagLoginViewController = [[HLLTAGLoginViewController alloc] initWithNibName:@"HLLTAGLoginViewController" bundle:nil];
    [self.navigationController pushViewController:tagLoginViewController animated:YES];
}

- (IBAction)sinaWeiboLoginButtonPressed:(id)sender
{
    [self loginWithType:ShareTypeSinaWeibo];
}

- (IBAction)qqSpaceLoginButtonPressed:(id)sender
{
    [self loginWithType:ShareTypeQQSpace];
}

- (IBAction)facebookLoginButtonPressed:(id)sender
{
    [self loginWithType:ShareTypeFacebook];
}

- (IBAction)twitterLoginButtonPressed:(id)sender
{
    [self loginWithType:ShareTypeTwitter];
}

#pragma mark - Private methods

- (void)loginWithType:(ShareType)shareType
{
    id<ISSAuthOptions> authOptions=[ShareSDK authOptionsWithAutoAuth:YES
                                                       allowCallback:NO
                                                       authViewStyle:SSAuthViewStyleModal
                                                        viewDelegate:nil
                                             authManagerViewDelegate:nil];
    [ShareSDK getUserInfoWithType:shareType
                      authOptions:authOptions
                           result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                               if (result)
                               {
                                   // login button notification
                                   NSMutableDictionary *notificationuUserInfo=[NSMutableDictionary dictionary];
                                   [notificationuUserInfo setValue:@YES forKey:@"logined"];
                                   [notificationuUserInfo setValue:self forKey:@"sender"];
                                   [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGELOGINSTATE object:self userInfo:notificationuUserInfo];
                                   
                                   // change share type to third id
                                   NSString *thirdId;
                                   switch(shareType)
                                   {
                                       case ShareTypeSinaWeibo:
                                           thirdId = DATA_API_THIRD_SINAWEIBO;
                                           break;
                                       case ShareTypeQQSpace:
                                           thirdId = DATA_API_THIRD_QQSPACE;
                                           break;
                                       case ShareTypeFacebook:
                                           thirdId = DATA_API_THIRD_FACEBOOK;
                                           break;
                                       case ShareTypeTwitter:
                                           thirdId = DATA_API_THIRD_TWITTER;
                                           break;
                                       default:
                                           thirdId = DATA_API_THIRD_SINAWEIBO;
                                   }
                                   
                                   // third login
                                   [HLLDataAPI userThirdLogin:self.view
                                                      thirdId:thirdId
                                                  thirdUserId:userInfo.uid
                                           thirdUserHeadImage:userInfo.icon
                                         thirdUserDescription:userInfo.desc
                                                   completion:nil
                                                      success:^(id json, JSONModelError *err) {
                                                          HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                                                          if (userModel)
                                                          {
                                                              // get login user info
                                                              HLLThirdAuthorizationModel* thirdModel = [[HLLThirdAuthorizationModel alloc] init];
                                                              thirdModel.id=[thirdId intValue];
                                                              thirdModel.user_id=[userInfo.uid intValue];
                                                              userModel.thirds=(NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>*)@[thirdModel];
                                                              
                                                              // set authorization user
                                                              [HLLDataAPI sharedInstance].authorizationUser=userModel;
                                                              
                                                              // hud
                                                              [HLLHud success:@"Login Completed" detail:nil];
                                                              
                                                              // checkpoint
                                                              [TestFlight passCheckpoint:@"Third Login OK."];
                                                              
                                                              // exit
                                                              [self dismissModalViewControllerAnimated:YES];
                                                          }
                                                      }
                                                        error:nil];
                               }
                               else
                               {
                                   if ([error errorCode] != -103)
                                   {
                                       [HLLHud error:@"登录失败" detail:@"授权失败"];
                                   }
                               }
                           }];
}

@end