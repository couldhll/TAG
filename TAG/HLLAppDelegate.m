//
//  HLLAppDelegate.m
//  TAG
//
//  Created by CouldHll on 13-9-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLAppDelegate.h"

#import "IIViewDeckController.h"
#import "HLLMainMenuViewController.h"
#import "HLLProductListViewController.h"

#import <Parse/Parse.h>
#import <ShareSDK/ShareSDK.h>
#import <SDWebImage/SDImageCache.h>

#import "HLLUserLoginViewController.h" // test

@implementation HLLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // init parse
    [Parse setApplicationId:@"vkPdg2r3Q9hdUNOWYY9CFrPwDXQVsYM47QLDUAIl"
                  clientKey:@"kkgJLtIAiNUBGhyLvtjpFpnYdvRFR4pBeRh7mTlp"];
    
    // init share
    [ShareSDK registerApp:@"9fae2ee15ce" useAppTrusteeship:YES];
    
    // add a custom read-only cache path
    NSString *bundledPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CustomPathImages"];
    [[SDImageCache sharedImageCache] addReadOnlyCachePath:bundledPath];
    
//    // create left and center and right controller
//    HLLMainMenuViewController* leftController = [[HLLMainMenuViewController alloc] initWithNibName:@"HLLMainMenuViewController" bundle:nil];
//    UIViewController *centerController = [[HLLProductListViewController alloc] initWithNibName:@"HLLProductListViewController" bundle:nil];
//    centerController = [[UINavigationController alloc] initWithRootViewController:centerController];
//    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:centerController
//                                                                                    leftViewController:leftController];
    
    UIViewController *centerController = [[HLLUserLoginViewController alloc] initWithNibName:@"HLLUserLoginViewController" bundle:nil];
    UIViewController *deckController = [[UINavigationController alloc] initWithRootViewController:centerController];
    
    // add controller
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
    
//    // first to show center view
//    [centerController.viewDeckController openLeftViewAnimated:NO];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url wxDelegate:nil];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
