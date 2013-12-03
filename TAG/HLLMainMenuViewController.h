//
//  HLLMainMenuViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface HLLMainMenuViewController : HLLViewController

@property (strong, nonatomic) IBOutlet HLLButton *productListButton;
@property (strong, nonatomic) IBOutlet HLLButton *brandButton;
@property (strong, nonatomic) IBOutlet HLLButton *favoriteButton;
@property (strong, nonatomic) IBOutlet HLLButton *friendButton;
@property (strong, nonatomic) IBOutlet HLLButton *followButton;
@property (strong, nonatomic) IBOutlet HLLButton *userHomeButton;
@property (strong, nonatomic) IBOutlet HLLButton *createCSButton;
@property (strong, nonatomic) IBOutlet HLLButton *settingButton;
@property (strong, nonatomic) IBOutlet HLLLoginButton *loginorloginoutButton;

- (IBAction)buttonPressed:(id)sender;

@end
