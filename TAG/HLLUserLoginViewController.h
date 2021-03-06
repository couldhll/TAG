//
//  HLLUserLoginViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLUserLoginViewController : HLLViewController

@property (strong, nonatomic) IBOutlet UIButton *exitButton;

- (IBAction)exitButtonPressed:(id)sender;

- (IBAction)tagRegisterButtonPressed:(id)sender;
- (IBAction)tagLoginButtonPressed:(id)sender;

- (IBAction)sinaWeiboLoginButtonPressed:(id)sender;
- (IBAction)qqSpaceLoginButtonPressed:(id)sender;
- (IBAction)facebookLoginButtonPressed:(id)sender;
- (IBAction)twitterLoginButtonPressed:(id)sender;


@end
