//
//  HLLUserRegisterViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserRegisterViewController.h"

@interface HLLUserRegisterViewController () <UITextFieldDelegate>

@end

@implementation HLLUserRegisterViewController

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
    self.userNameTextField.returnKeyType = UIReturnKeyNext;
    self.userNameTextField.clearsOnBeginEditing = YES;
    self.userNameTextField.delegate=self;
    self.userPasswordTextField.returnKeyType = UIReturnKeyNext;
    self.userPasswordTextField.clearsOnBeginEditing = YES;
    self.userPasswordTextField.delegate=self;
    self.userPasswordVerifyTextField.returnKeyType = UIReturnKeyJoin;
    self.userPasswordVerifyTextField.clearsOnBeginEditing = YES;
    self.userPasswordVerifyTextField.delegate=self;
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
    // login notification
    NSMutableDictionary *notificationuUserInfo=[NSMutableDictionary dictionary];
    [notificationuUserInfo setValue:@NO forKey:@"logined"];
    [notificationuUserInfo setValue:self forKey:@"sender"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGELOGINSTATE object:self userInfo:notificationuUserInfo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerButtonPressed:(id)sender
{
    if (![self verifyData])
    {
        return;
    }
    
    // register
    [HLLDataAuthorizeProvider userRegister:self.view
                       email:self.userEmailTextField.text
                        name:self.userNameTextField.text
                    password:self.userPasswordTextField.text
                  completion:nil
                     success:^(id json, JSONModelError *err) {
                         HLLUserModel *userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                         if (userModel)
                         {
                             // get login user info
                             userModel.email=self.userEmailTextField.text;
                             userModel.name=self.userNameTextField.text;
                             userModel.password=self.userPasswordTextField.text;
                             
                             // set authorization user
                             [HLLUserData sharedInstance].authorizationUser=userModel;
                             
                             // hud
                             [HLLHud success:NSLocalizedString(@"Hud_Success_UserAuthorize_RegisterCompleted",@"") detail:nil];
                             
                             // checkpoint
                             [TestFlight passCheckpoint:CHECKPOINT_USER_REGISTER];
                             
                             // exit
                             [self dismissViewControllerAnimated:YES completion:nil];
                         }
                     }
                       error:nil];
}

- (IBAction)backgroundPressed:(id)sender
{
    [self.userEmailTextField resignFirstResponder];
    [self.userNameTextField resignFirstResponder];
    [self.userPasswordTextField resignFirstResponder];
    [self.userPasswordVerifyTextField resignFirstResponder];
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
    
    if (![HLLDataVerify verifyUserNameWithTextField:self.userNameTextField])
    {
        return NO;
    }
    
    if (![HLLDataVerify verifyUserPasswordWithTextField:self.userPasswordTextField])
    {
        return NO;
    }
    
    if (![HLLDataVerify verifyUserPasswordSameWithTextField:self.userPasswordTextField anotherTextField:self.userPasswordVerifyTextField])
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
                [self.userNameTextField becomeFirstResponder];
            }
            else if (textField==self.userNameTextField)
            {
                [self.userPasswordTextField becomeFirstResponder];
            }
            else if (textField==self.userPasswordTextField)
            {
                [self.userPasswordVerifyTextField becomeFirstResponder];
            }
			break;
		case UIReturnKeyJoin:
			[textField resignFirstResponder];
			[self registerButtonPressed:nil];
			break;
		default:
			break;
	}
	return YES;
}

@end
