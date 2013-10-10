//
//  HLLAPI.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLAPI.h"
#import "HLLUserLoginViewController.h"

@implementation HLLAPI

#pragma mark - Singleton methods

/**
 * Singleton methods
 */
+ (HLLAPI *)sharedInstance
{
    static HLLAPI *sharedInstance = nil;
    static dispatch_once_t  oncePredicate;

    dispatch_once(&oncePredicate, ^{
            sharedInstance = [[self alloc] init];
//            sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAPIHost]];
        });

    return sharedInstance;
}

-(BOOL)isAuthorized
{
    return YES;
}

-(void)save:(UIViewController*)sender
{
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

@end