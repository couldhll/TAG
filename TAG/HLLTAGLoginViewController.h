//
//  HLLUserLoginViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLTAGLoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField  *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField  *userPasswordTextField;

- (IBAction)loginButtonPressed:(id)sender;

- (IBAction)backgroundPressed:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;

@end