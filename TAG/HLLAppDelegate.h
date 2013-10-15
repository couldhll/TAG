//
//  HLLAppDelegate.h
//  TAG
//
//  Created by CouldHll on 13-9-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IIViewDeckController.h"

@interface HLLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) IIViewDeckController *deckController;

- (void)openViewController:(NSString *)name sender:(UIViewController*)sender;

@end
