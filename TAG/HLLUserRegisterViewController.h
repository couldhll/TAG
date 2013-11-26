//
//  HLLUserRegisterViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLUserRegisterViewController : HLLViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userEmailTextField;
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *userPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *userPasswordVerifyTextField;

@property (strong, nonatomic) IBOutlet UIButton *exitButton;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)exitButtonPressed:(id)sender;

- (IBAction)registerButtonPressed:(id)sender;

- (IBAction)backgroundPressed:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;

@end
