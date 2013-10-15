//
//  HLLUserLoginViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserLoginViewController.h"

#import "HLLTAGLoginViewController.h"

#import <Parse/Parse.h>
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
    
}

- (IBAction)tagLoginButtonPressed:(id)sender
{
    HLLTAGLoginViewController *tagLoginViewController = [[HLLTAGLoginViewController alloc] initWithNibName:@"HLLTAGLoginViewController" bundle:nil];
    [self.navigationController pushViewController:tagLoginViewController animated:YES];
}

- (IBAction)sinaWeiboLoginButtonPressed:(id)sender
{
    id<ISSAuthOptions> authOptions=[ShareSDK authOptionsWithAutoAuth:YES
                                              allowCallback:NO
                                              authViewStyle:SSAuthViewStyleModal
                                               viewDelegate:nil
                                    authManagerViewDelegate:nil];
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo
                      authOptions:authOptions
                           result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                               if (result)
                               {
                                   //登录成功
                                   //显示注销按钮
//                                   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销"
//                                                                                                              style:UIBarButtonItemStyleBordered
//                                                                                                             target:self
//                                                                                                             action:@selector(logoutButtonClickHandler:)];
                                   NSLog(@"%@",userInfo.uid);
                                   
                                   //判断是否注册
                                   PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
                                   [query whereKey:@"userId" equalTo:[userInfo uid]];
                                   [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                                       //写入用户数据
                                       if ([objects count] == 0)
                                       {
                                           PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                                           [newUser setObject:[userInfo uid] forKey:@"userId"];
                                           [newUser setObject:[userInfo nickname]
                                                       forKey:@"nickname"];
                                           [newUser setObject:[userInfo icon] forKey:@"icon"];
                                           [newUser saveInBackground];
                                       }
                                   }];
                                   
                                   // exit
                                   [self dismissModalViewControllerAnimated:YES];

//                                   UserViewController *userVC = [[UserViewController alloc] initWithUser:_userInfo];
//                                   [self.navigationController pushViewController:userVC animated:YES];
                               }
                               else
                               {
                                   if ([error errorCode] != -103)
                                   {
                                       //非取消授权则显示提示
                                       //登录失败
                                       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                           message:[NSString stringWithFormat:@"登录失败!%@", [error errorDescription]]
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"知道了"
                                                                                 otherButtonTitles:nil];
                                       [alertView show];
                                   }
                               }
                           }];
}

- (IBAction)qqLoginButtonPressed:(id)sender
{
    id<ISSAuthOptions> authOptions=[ShareSDK authOptionsWithAutoAuth:YES
                                                       allowCallback:NO
                                                       authViewStyle:SSAuthViewStyleModal
                                                        viewDelegate:nil
                                             authManagerViewDelegate:nil];
    [ShareSDK getUserInfoWithType:ShareTypeQQ
                      authOptions:authOptions
                           result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                               if (result)
                               {
                                   //登录成功
                                   //显示注销按钮
                                   //                                   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销"
                                   //                                                                                                              style:UIBarButtonItemStyleBordered
                                   //                                                                                                             target:self
                                   //                                                                                                             action:@selector(logoutButtonClickHandler:)];
                                   NSLog(@"%@",userInfo.uid);
                                   
                                   //判断是否注册
                                   PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
                                   [query whereKey:@"userId" equalTo:[userInfo uid]];
                                   [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                                       //写入用户数据
                                       if ([objects count] == 0)
                                       {
                                           PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                                           [newUser setObject:[userInfo uid] forKey:@"userId"];
                                           [newUser setObject:[userInfo nickname]
                                                       forKey:@"nickname"];
                                           [newUser setObject:[userInfo icon] forKey:@"icon"];
                                           [newUser saveInBackground];
                                       }
                                   }];
                                   
                                   // exit
                                   [self dismissModalViewControllerAnimated:YES];
                                   
                                   //                                   UserViewController *userVC = [[UserViewController alloc] initWithUser:_userInfo];
                                   //                                   [self.navigationController pushViewController:userVC animated:YES];
                               }
                               else
                               {
                                   if ([error errorCode] != -103)
                                   {
                                       //非取消授权则显示提示
                                       //登录失败
                                       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                           message:[NSString stringWithFormat:@"登录失败!%@", [error errorDescription]]
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"知道了"
                                                                                 otherButtonTitles:nil];
                                       [alertView show];
                                   }
                               }
                           }];
}

- (IBAction)facebookLoginButtonPressed:(id)sender
{
    id<ISSAuthOptions> authOptions=[ShareSDK authOptionsWithAutoAuth:YES
                                                       allowCallback:NO
                                                       authViewStyle:SSAuthViewStyleModal
                                                        viewDelegate:nil
                                             authManagerViewDelegate:nil];
    [ShareSDK getUserInfoWithType:ShareTypeFacebook
                      authOptions:authOptions
                           result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                               if (result)
                               {
                                   //登录成功
                                   //显示注销按钮
                                   //                                   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销"
                                   //                                                                                                              style:UIBarButtonItemStyleBordered
                                   //                                                                                                             target:self
                                   //                                                                                                             action:@selector(logoutButtonClickHandler:)];
                                   NSLog(@"%@",userInfo.uid);
                                   
                                   //判断是否注册
                                   PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
                                   [query whereKey:@"userId" equalTo:[userInfo uid]];
                                   [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                                       //写入用户数据
                                       if ([objects count] == 0)
                                       {
                                           PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                                           [newUser setObject:[userInfo uid] forKey:@"userId"];
                                           [newUser setObject:[userInfo nickname]
                                                       forKey:@"nickname"];
                                           [newUser setObject:[userInfo icon] forKey:@"icon"];
                                           [newUser saveInBackground];
                                       }
                                   }];
                                   
                                   // exit
                                   [self dismissModalViewControllerAnimated:YES];
                                   
                                   //                                   UserViewController *userVC = [[UserViewController alloc] initWithUser:_userInfo];
                                   //                                   [self.navigationController pushViewController:userVC animated:YES];
                               }
                               else
                               {
                                   if ([error errorCode] != -103)
                                   {
                                       //非取消授权则显示提示
                                       //登录失败
                                       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                           message:[NSString stringWithFormat:@"登录失败!%@", [error errorDescription]]
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"知道了"
                                                                                 otherButtonTitles:nil];
                                       [alertView show];
                                   }
                               }
                           }];
}

@end