//
//  HLLMainMenuViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface HLLMainMenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton  *productListButton;
@property (strong, nonatomic) IBOutlet UIButton  *loginorloginoutButton;

- (IBAction)productListButtonPressed:(id)sender;
- (IBAction)favoriteButtonPressed:(id)sender;
- (IBAction)friendButtonPressed:(id)sender;
- (IBAction)followButtonPressed:(id)sender;
- (IBAction)userHomeButtonPressed:(id)sender;
- (IBAction)newCSButtonPressed:(id)sender;
- (IBAction)settingButtonPressed:(id)sender;
- (IBAction)loginorloginoutButtonPressed:(id)sender;

@end
