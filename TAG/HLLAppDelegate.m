//
//  HLLAppDelegate.m
//  TAG
//
//  Created by CouldHll on 13-9-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLAppDelegate.h"

#import "HLLMainMenuViewController.h"
#import "HLLProductListViewController.h"
#import "HLLNavigationController.h"
#import "HLLUserLoginViewController.h"

#import <Analytics/Analytics.h>
//#import <Parse/Parse.h>
#import <ShareSDK/ShareSDK.h>
#import <SDWebImage/SDImageCache.h>
//#import <GoogleAnalytics-iOS-SDK/GAI.h>
#import <Crashlytics/Crashlytics.h>

#import "HLLCurrencyView.h"

@implementation HLLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    // init GoogleSDK
//    // Optional: automatically send uncaught exceptions to Google Analytics.
//    [GAI sharedInstance].trackUncaughtExceptions = YES;
//    
//    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
//    [GAI sharedInstance].dispatchInterval = 20;
//    
//    // Optional: set Logger to VERBOSE for debug information.
//    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
//    
//    // Initialize tracker.1
//    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-44893963-1"];

    
//    // init ParseSDK
//    [Parse setApplicationId:@"vkPdg2r3Q9hdUNOWYY9CFrPwDXQVsYM47QLDUAIl"
//                  clientKey:@"kkgJLtIAiNUBGhyLvtjpFpnYdvRFR4pBeRh7mTlp"];
    
    // init Segment.io
    [Analytics debug:NO];
    [Analytics initializeWithSecret:@"ssk779cj9nb8ziq5750x"];
    
    // init ShareSDK
    [ShareSDK registerApp:@"9fae2ee15ce" useAppTrusteeship:YES];
    
    // init CrashlyticsSDK
    [Crashlytics startWithAPIKey:@"d37585287245935f2ae51d8b4f5a1957eabfa72a"];
    
    // init TestFlightSDK
    [TestFlight takeOff:@"ad6de598-32c2-427f-bfad-490befc98e71"];
    
    // add a custom read-only cache path
    NSString *bundledPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CustomPathImages"];
    [[SDImageCache sharedImageCache] addReadOnlyCachePath:bundledPath];
    
    // first launch
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    
    // create left and right and center controller
    UIViewController* leftController = [[HLLMainMenuViewController alloc] initWithNibName:@"HLLMainMenuViewController" bundle:nil];
//    UIViewController *centerController = [[HLLProductListViewController alloc] initWithNibName:@"HLLProductListViewController" bundle:nil];
//    self.navigationController = [[HLLNavigationController alloc] initWithRootViewController:centerController];// navagation controller
//    centerController=self.navigationController;
//    self.deckController =  [[IIViewDeckController alloc] initWithCenterViewController:centerController
//                                                                   leftViewController:leftController];
    self.deckController =  [[IIViewDeckController alloc] initWithCenterViewController:nil
                                                                                    leftViewController:leftController];
    
    // disable class
    [self.deckController disablePanOverViewsOfClass:NSClassFromString(@"HLLCurrencyView")];
    [self.deckController disablePanOverViewsOfClass:NSClassFromString(@"GMGridViewCell")];
    
    // add controller
    self.window.rootViewController = self.deckController;
    [self.window makeKeyAndVisible];
    
    // first page
    [self openViewController:@"HLLProductListViewController" sender:nil];
    
    // first launch to show the side
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        [self.deckController previewBounceView:IIViewDeckLeftSide
                                withCompletion:^(IIViewDeckController *controller, BOOL success) {
                                    [self.deckController previewBounceView:IIViewDeckRightSide];
                                }];
    }
    
    // check Authorize
//    [[HLLUserData sharedInstance] checkAuthorize:self.window.rootViewController];
    
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

#pragma mark - Controller

- (void)openViewController:(NSString *)name sender:(UIViewController*)sender
{
    NSLog(@"Change center controller:%@",name);
    
    // name null to return
    if (!name)
    {
        return;
    }
    
    // name same to return
    UIViewController *centerController=self.deckController.centerController;
    if ([centerController isKindOfClass:HLLNavigationController.class])// centerController is the topViewController of HLLNavigationController
    {
        centerController=((HLLNavigationController*)centerController).topViewController;
    }
    if ([name isEqual:NSStringFromClass(centerController.class)])
    {
        return;
    }
    
    // default sender
    if (sender==nil)
    {
        sender=self.window.rootViewController;
    }
    
    if ([name isEqual:@"HLLUserLoginViewController"])
    {
        // popup login page
        UIViewController *viewController = [[HLLUserLoginViewController alloc] initWithNibName:@"HLLUserLoginViewController" bundle:nil];
        viewController = [[UINavigationController alloc] initWithRootViewController:viewController];
        //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        //        [self.popoverController dismissPopoverAnimated:NO];
        //        self.popoverController = [[UIPopoverController alloc] initWithContentViewController:picker];
        //        [self.popoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        //    }
        //    else {
        [sender presentModalViewController:viewController animated:YES];
        //    }
    }
    else
    {
        // create center controller class
        Class centerControllerClass =  NSClassFromString(name);
        UIViewController * centerController = [[centerControllerClass alloc] initWithNibName:name bundle:nil];
        
        // create new navagation bar
        self.navigationController = [[HLLNavigationController alloc] initWithRootViewController:centerController];// navagation controller
        centerController=self.navigationController;
        self.deckController.centerController=centerController;
    }
    
    // notification
    NSMutableDictionary *userInfo=[NSMutableDictionary dictionary];
    [userInfo setValue:name forKey:@"name"];
    [userInfo setValue:sender forKey:@"sender"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_OPENVIEWCONTROLLER object:self userInfo:userInfo];
}

@end
