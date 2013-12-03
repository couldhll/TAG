//
//  HLLUserLoginViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTAGLoginViewController.h"

@interface HLLTAGLoginViewController () <UITextFieldDelegate>

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
    // login notification
    NSMutableDictionary *notificationuUserInfo=[NSMutableDictionary dictionary];
    [notificationuUserInfo setValue:@NO forKey:@"logined"];
    [notificationuUserInfo setValue:self forKey:@"sender"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGELOGINSTATE object:self userInfo:notificationuUserInfo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginButtonPressed:(id)sender
{
    if (![self verifyData])
    {
        return;
    }
    
    // tag login
    HLLUserModel* userModel = [[HLLUserModel alloc] init];
    userModel.email=self.userEmailTextField.text;
    userModel.password=self.userPasswordTextField.text;
    [HLLDataAuthorizeProvider userLoginWithModel:userModel
                             completion:nil
                                success:^(id json, JSONModelError *e) {
                                    // exit
                                    [self dismissViewControllerAnimated:YES completion:nil];
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