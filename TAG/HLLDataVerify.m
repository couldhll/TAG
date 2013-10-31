//
//  HLLDataVerify.m
//  TAG
//
//  Created by CouldHll on 13-10-31.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataVerify.h"

#import <RegexKitLite/RegexKitLite.h>

@implementation HLLDataVerify

#pragma mark - Regex Verify

+ (BOOL)verifyData:(NSString*)data regex:(NSString*)regex
{
    BOOL result=NO;
    
    // verify by regex
    if ([data isMatchedByRegex:regex])
    {
        result=YES;
    }
    
    return result;
}

+ (BOOL)verifyDataWithTextField:(UITextField*)textField regex:(NSString*)regex hudTitle:(NSString*)hudTitle hudDetail:(NSString*)hudDetail
{
    BOOL result=YES;
    
    // check
    if (![self verifyData:textField.text regex:regex])
    {
        // hud
        if (hudTitle!=nil)
        {
            [HLLHud error:hudTitle detail:hudDetail];
        }

        // keyword focus to the TextField
        [textField becomeFirstResponder];
        
        result=NO;
    }
    
    return result;
}

#pragma mark - Regex Verify for User

+ (BOOL)verifyUserEmailWithTextField:(UITextField*)textField
{
    return [self verifyDataWithTextField:textField regex:REGEX_EMAIL hudTitle:NSLocalizedString(@"Hud_Error_UserAuthorize_EmailNoMatch",@"") hudDetail:@""];
}

+ (BOOL)verifyUserNameWithTextField:(UITextField*)textField
{
    return [self verifyDataWithTextField:textField regex:REGEX_ACCOUNT hudTitle:NSLocalizedString(@"Hud_Error_UserAuthorize_NameNoMatch",@"") hudDetail:@""];
}

+ (BOOL)verifyUserPasswordWithTextField:(UITextField*)textField
{
    return [self verifyDataWithTextField:textField regex:REGEX_PASSWORD hudTitle:NSLocalizedString(@"Hud_Error_UserAuthorize_PasswordNoMatch",@"") hudDetail:@""];
}

#pragma mark - Other Verify

+ (BOOL)verifyUserPasswordSameWithTextField:(UITextField*)textField anotherTextField:(UITextField*)anotherTextField
{
    BOOL result=YES;
    
    // check password same
    if (![textField.text isEqual:anotherTextField.text])
    {
        [HLLHud error:NSLocalizedString(@"Hud_Error_UserAuthorize_PasswordNoSame",@"") detail:@""];
        [textField becomeFirstResponder];
        result=NO;
    }
    
    return result;
}

@end
