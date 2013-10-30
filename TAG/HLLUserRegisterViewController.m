//
//  HLLUserRegisterViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserRegisterViewController.h"

#import <CocoaSecurity/CocoaSecurity.h>
#import <RegexKitLite/RegexKitLite.h>

@interface HLLUserRegisterViewController ()

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
    self.userEmailTextField.clearsOnBeginEditing = YES;
    self.userEmailTextField.delegate=self;
    self.userNameTextField.returnKeyType = UIReturnKeyNext;
    self.userNameTextField.clearsOnBeginEditing = YES;
    self.userNameTextField.delegate=self;
    self.userPasswordTextField.returnKeyType = UIReturnKeyNext;
    self.userPasswordTextField.clearsOnBeginEditing = YES;
    self.userPasswordTextField.delegate=self;
    self.userPasswordVerifyTextField.returnKeyType = UIReturnKeyGo;
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

- (IBAction)registerButtonPressed:(id)sender
{
    if (![self isVerify])
    {
        return;
    }
    
    [HLLDataAPI userRegister:self.view
                       email:self.userEmailTextField.text
                        name:self.userNameTextField.text
                    password:self.userPasswordTextField.text
                  completion:nil
                     success:^(id json, JSONModelError *err) {
                         HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                         if (userModel)
                         {
                             // get login user info
                             userModel.email=self.userEmailTextField.text;
                             userModel.name=self.userNameTextField.text;
                             userModel.password=self.userPasswordTextField.text;
                             
                             // set authorization user
                             [HLLDataAPI sharedInstance].authorizationUser=userModel;
                             
                             // hud
                             [HLLHud success:@"Register Completed" detail:nil];
                             
                             // checkpoint
                             [TestFlight passCheckpoint:@"User Register OK."];
                             
                             // exit
                             [self dismissModalViewControllerAnimated:YES];
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

#pragma mark - Private Method

- (BOOL)isVerify
{
//    BOOL result=YES;
    
    // check email
    if ([self.userEmailTextField.text isMatchedByRegex:REGEX_EMAIL])
    {
        [HLLHud error:self.view title:@"邮箱不正确" detail:@""];
        
//        result=NO;
        return NO;
    }
    
    // check password
    if ([self.userPasswordTextField.text isEqual:self.userPasswordVerifyTextField.text])
    {
        [HLLHud error:self.view title:@"密码不相同" detail:@""];
        
//        result=NO;
        return NO;
    }
    
//    return result;
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
		case UIReturnKeyGo:
			[textField resignFirstResponder];
			[self registerButtonPressed:nil];
			break;
		default:
			break;
	}
	return YES;
}

@end
