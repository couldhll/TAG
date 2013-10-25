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
    self.userNameTextField.returnKeyType = UIReturnKeyNext;
    self.userNameTextField.clearsOnBeginEditing = YES;
    self.userNameTextField.delegate=self;
    self.userPasswordTextField.returnKeyType = UIReturnKeyGo;
    self.userPasswordTextField.clearsOnBeginEditing = YES;
    self.userPasswordTextField.delegate=self;
    
    // show the keyboard
    [self.userNameTextField becomeFirstResponder];
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

- (IBAction)loginButtonPressed:(id)sender
{
    //    NSString *msg=nil;
    //    if(userNameTextField.text.length>0 && userPasswordTextField.text.length>0)
    //    {
    //        msg=[[NSString alloc]initWithFormat:@”Name:%@ login!”,nameField.text];
    //    }
    //    else
    //    {
    //        msg=[[NSString alloc]initWithFormat:@”Please input name or password!”];
    //    }
    //
    //
    //
    //    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@”Something was done” message:msg delegate:self cancelButtonTitle:@”Cancel!” otherButtonTitles:nil];
    //    [alert show];

    //    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    //        // Do something...
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [MBProgressHUD hideHUDForView:self.view animated:YES];
    //        });
    //    });
    
//    // hud login success
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Resource/Frame/HUD/hud_mark_check.png"]];
//    hud.labelText = @"Completed";
//    int64_t         delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
//                   {
//                       // close hud
//                       [MBProgressHUD hideHUDForView:self.view animated:YES];
//                       
//                       // exit
//                       [self dismissModalViewControllerAnimated:YES];
//                   });
}

- (IBAction)findPasswordButtonPressed:(id)sender
{
    
}

- (IBAction)backgroundPressed:(id)sender
{
    [self.userNameTextField resignFirstResponder];
    [self.userPasswordTextField resignFirstResponder];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	switch (textField.returnKeyType)
    {
		case UIReturnKeyNext:
            if (textField==self.userNameTextField)
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