//
//  HLLUserLoginViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLTAGLoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField  *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField  *userPasswordTextField;
@property (strong, nonatomic) IBOutlet UIButton  *exitButton;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)exitButtonPressed:(id)sender;

- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)findPasswordButtonPressed:(id)sender;

- (IBAction)backgroundPressed:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;

@end