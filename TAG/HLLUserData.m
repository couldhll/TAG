//
//  HLLUserData.m
//  TAG
//
//  Created by CouldHll on 13-10-31.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserData.h"

#import <KeychainItemWrapper/KeychainItemWrapper.h>
//#import <SSKeychain/SSKeychain.h>

@interface HLLUserData ()
{
    KeychainItemWrapper *wrapper;
}

@end

@implementation HLLUserData

@synthesize authorizationUser;
@synthesize isAuthorized;

#pragma mark - Singleton methods

+ (instancetype)sharedInstance
{
    static HLLUserData *sharedInstance = nil;
    static dispatch_once_t  oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Init

- (id)init
{
    self = [super init];
    if (self) {
        isAuthorized=NO;
        
//        wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"Account" accessGroup:[[NSBundle mainBundle] bundleIdentifier]];
        wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"Password" accessGroup:nil];
    }
    return self;
}

#pragma mark - Property

- (HLLUserModel*)authorizationUser
{
    if (authorizationUser==nil)// load from keychain
    {
//        NSString *aaa=[wrapper objectForKey:(__bridge id)kSecAttrAccount];
//        HLLUserModel *userModel=[wrapper objectForKey:(__bridge id)kSecValueData];
//        authorizationUser=userModel;
        
        NSString *account = [wrapper objectForKey:(__bridge id)kSecAttrAccount];
        NSString *password = [wrapper objectForKey:(__bridge id)kSecValueData];
        
        if (![account isEqual:@""])
        {
            HLLUserModel *userModel=[[HLLUserModel alloc] init];
            
            if ([HLLDataVerify verifyData:account regex:REGEX_EMAIL])
            {
                userModel.email=account;
                userModel.password=password;
            }
            else
            {
                HLLThirdAuthorizationModel *thirdModel=[[HLLThirdAuthorizationModel alloc] init];
                thirdModel.id=[account intValue];
                thirdModel.user_id=password;
                userModel.thirds=(NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>*)@[thirdModel];
            }
            
            authorizationUser=userModel;
        }
        
//        NSArray *keychains=[SSKeychain accountsForService:[[NSBundle mainBundle] bundleIdentifier]];
//        
//        if (keychains)
//        {
//            NSDictionary *keychain=keychains[0];
//            
//            if (keychain!=nil)
//            {
//                NSString *account = [keychain objectForKey:@"acct"];
//                NSString *password = [SSKeychain passwordForService:[[NSBundle mainBundle] bundleIdentifier] account:account];
//                
//                HLLUserModel *userModel=[[HLLUserModel alloc] init];
//                
//                if (![HLLDataVerify verifyData:account regex:REGEX_EMAIL])
//                {
//                    HLLThirdAuthorizationModel *thirdModel=[[HLLThirdAuthorizationModel alloc] init];
//                    thirdModel.id=[account intValue];
//                    thirdModel.user_id=[password intValue];
//                    userModel.thirds=(NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>*)@[thirdModel];
//                }
//                else
//                {
//                    userModel.email=account;
//                    userModel.password=password;
//                }
//                
//                authorizationUser=userModel;
//            }
//        }
        
        
//        // load account to keycain
//        SSKeychainQuery *query = [[SSKeychainQuery alloc] init];
//        query.service = [[NSBundle mainBundle] bundleIdentifier];
//        query.account = @"Account";
//        query.passwordData = nil;
//        NSError *error = nil;
//        if([query fetch:&error])
//        {
//            authorizationUser=(HLLUserModel*)query.passwordData;
//        }
//        if (error!=nil)
//        {
//            NSLog(@"Unable to fetch keychain item: %@", error);
//        }
    }
    
    return authorizationUser;
}

- (void)setAuthorizationUser:(HLLUserModel*)userModel
{
    authorizationUser=userModel;
    
    if (authorizationUser==nil)
    {
        isAuthorized=NO;
    }
    else
    {
        isAuthorized=YES;
        
        //    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"Password" accessGroup:nil];
        //    wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"Account" accessGroup:[[NSBundle mainBundle] bundleIdentifier]];
        //    wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"Account" accessGroup:nil];
        
        // delete all keychain
        [wrapper resetKeychainItem];
        
        if (authorizationUser.canTAGAuthorize)
        {
            [wrapper setObject:userModel.email forKey:(__bridge id)kSecAttrAccount];
            [wrapper setObject:userModel.password forKey:(__bridge id)kSecValueData];
        }
        else if(authorizationUser.canThirdAuthorize)
        {
            HLLThirdAuthorizationModel *thirdAuthorizationModel=[authorizationUser.thirds objectAtIndex:0];
            
            
            //        [wrapper setObject:[NSNumber numberWithInt:thirdAuthorizationModel.id] forKey:(__bridge id)kSecAttrService];
            //        [wrapper setObject:userModel forKey:(__bridge id)kSecAttrService];
            
            //        [wrapper setObject:[NSNumber numberWithInt:thirdAuthorizationModel.id] forKey:(__bridge id)kSecAttrAccount];
            //        [wrapper setObject:[NSNumber numberWithInt:thirdAuthorizationModel.user_id] forKey:(__bridge id)kSecValueData];
            
            [wrapper setObject:[NSString stringWithFormat:@"%d",thirdAuthorizationModel.id] forKey:(__bridge id)kSecAttrAccount];
            [wrapper setObject:thirdAuthorizationModel.user_id forKey:(__bridge id)kSecValueData];
        }
        
        
        //    // delete all keychain
        //    SSKeychainQuery *query = [[SSKeychainQuery alloc] init];
        //    query.service = [[NSBundle mainBundle] bundleIdentifier];
        //    NSError *error = nil;
        //    [query deleteItem:&error];
        
        //    // save to keychain
        ////    [wrapper setObject:[NSString stringWithFormat:@"%d",userModel.id] forKey:(__bridge id)kSecAttrAccount];
        ////    [wrapper setObject:userModel forKey:(__bridge id)kSecValueData];
        //    if (self.authorizationUser.canThirdAuthorize)
        //    {
        //        HLLThirdAuthorizationModel *thirdAuthorizationModel=[self.authorizationUser.thirds objectAtIndex:0];
        //
        //        [wrapper setObject:[NSString stringWithFormat:@"%d",thirdAuthorizationModel.id] forKey:(__bridge id)kSecAttrAccount];
        //        [wrapper setObject:[NSString stringWithFormat:@"%d",thirdAuthorizationModel.user_id] forKey:(__bridge id)kSecValueData];
        //
        ////        [SSKeychain setPassword:[NSString stringWithFormat:@"%d",thirdAuthorizationModel.user_id] forService:[[NSBundle mainBundle] bundleIdentifier] account:[NSString stringWithFormat:@"%d",thirdAuthorizationModel.id]];
        //    }
        //    else
        //    {
        //        [wrapper setObject:userModel.email forKey:(__bridge id)kSecAttrAccount];
        //        [wrapper setObject:userModel.password forKey:(__bridge id)kSecValueData];
        //
        ////        [SSKeychain setPassword:userModel.password forService:[[NSBundle mainBundle] bundleIdentifier] account:userModel.email];
        //    }
        
        //    // save account to keycain
        //    SSKeychainQuery *query = [[SSKeychainQuery alloc] init];
        //    query.account=@"Account";
        //    query.passwordData=(NSData*)userModel;
        //    NSError *error = nil;
        //    [query save:&error];
        //    if (error!=nil)
        //    {
        //        NSLog(@"Unable to save item: %@", error);
        //    }
        
        // change user for Analytics
        [[Analytics sharedAnalytics] identify:[NSString stringWithFormat:@"%d",userModel.id] traits:nil];
    }
}

#pragma mark - Public methods

//- (BOOL)isAuthorized
//{
//    return self.authorizationUser!=nil;
//}

- (BOOL)checkAuthorize:(UIViewController*)sender
{
    BOOL result=YES;
    
    if (!self.isAuthorized)
    {
        if (self.authorizationUser!=nil)
        {
            // use authorizationUser to login
            [HLLDataAuthorizeProvider userLoginWithModel:authorizationUser
                                              completion:nil
                                                 success:nil
                                                   error:nil];
        }
        else
        {
            // popup UserLoginViewcontroller to login
            [AppDelegate openViewController:@"HLLUserLoginViewController" sender:sender];
            
            // hud
            [HLLHud error:NSLocalizedString(@"Hud_Error_UserAuthorize_NeedLogin",@"") detail:nil];
        }
        
        result=NO;
    }
    
    return result;
}

@end
