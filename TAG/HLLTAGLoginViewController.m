//
//  HLLUserLoginViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTAGLoginViewController.h"

@interface HLLTAGLoginViewController ()

@end

@implementation HLLTAGLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Custom initialization
    }

    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // textfield
    self.userEmailTextField.returnKeyType = UIReturnKeyNext;
    self.userEmailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.userEmailTextField.clearsOnBeginEditing = YES;
    self.userEmailTextField.delegate=self;
    self.userPasswordTextField.returnKeyType = UIReturnKeyGo;
    self.userPasswordTextField.clearsOnBeginEditing = YES;
    self.userPasswordTextField.delegate=self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // show the keyboard
    [self.userEmailTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // hide the keyboard
    [self backgroundPressed:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Actions

- (IBAction)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)exitButtonPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)loginButtonPressed:(id)sender
{
    if (![self verifyData])
    {
        return;
    }
    
    // TAG login
    [HLLDataAPI userLogin:self.view
                    email:self.userEmailTextField.text
                 password:self.userPasswordTextField.text
               completion:nil
                  success:^(id json, JSONModelError *err) {
                      HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                      if (userModel)
                      {
                          // get login user info
                          userModel.email=self.userEmailTextField.text;
                          userModel.password=self.userPasswordTextField.text;
                          
                          // set authorization user
                          [HLLUserData sharedInstance].authorizationUser=userModel;
                          
                          // hud
                          [HLLHud success:NSLocalizedString(@"Hud_Success_UserAuthorize_LoginCompleted",@"") detail:nil];
                          
                          // checkpoint
                          [TestFlight passCheckpoint:CHECKPOINT_USER_TAGLOGIN];
                          
                          // exit
                          [self dismissModalViewControllerAnimated:YES];
                      }
                  }
                    error:nil];
}

- (IBAction)findPasswordButtonPressed:(id)sender
{
    
}

- (IBAction)backgroundPressed:(id)sender
{
    [self.userEmailTextField resignFirstResponder];
    [self.userPasswordTextField resignFirstResponder];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark - Verify Data

- (BOOL)verifyData
{
    if (![HLLDataVerify verifyUserEmailWithTextField:self.userEmailTextField])
    {
        return NO;
    }
    
    if (![HLLDataVerify verifyUserPasswordWithTextField:self.userPasswordTextField])
    {
        return NO;
    }
    
    return YES;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	switch (textField.returnKeyType)
    {
		case UIReturnKeyNext:
            if (textField==self.userEmailTextField)
            {
                [self.userPasswordTextField becomeFirstResponder];
            }
			break;
		case UIReturnKeyGo:
			[textField resignFirstResponder];
			[self loginButtonPressed:nil];
			break;
		default:
			break;
	}
	return YES;
}

@end