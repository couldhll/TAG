//
//  HLLUserLoginViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLUserLoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton  *exitButton;

- (IBAction)exitButtonPressed:(id)sender;

- (IBAction)tagRegisterButtonPressed:(id)sender;
- (IBAction)tagLoginButtonPressed:(id)sender;

- (IBAction)sinaWeiboLoginButtonPressed:(id)sender;
- (IBAction)qqLoginButtonPressed:(id)sender;
- (IBAction)facebookLoginButtonPressed:(id)sender;


@end
