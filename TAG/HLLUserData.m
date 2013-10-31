//
//  HLLUserData.m
//  TAG
//
//  Created by CouldHll on 13-10-31.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserData.h"

#import <SSKeychain/SSKeychain.h>

@implementation HLLUserData

@synthesize authorizationUser;

#pragma mark - Singleton methods

+ (HLLUserData *)sharedInstance
{
    static HLLUserData *sharedInstance = nil;
    static dispatch_once_t  oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Property

- (HLLUserModel*)authorizationUser
{
    if (authorizationUser==nil)// load account to keycain
    {
        NSArray *keychains=[SSKeychain accountsForService:[[NSBundle mainBundle] bundleIdentifier]];
        
        if (keychains)
        {
            NSDictionary *keychain=keychains[0];
            
            if (keychain!=nil)
            {
                NSString *account = [keychain objectForKey:@"acct"];
                NSString *password = [SSKeychain passwordForService:[[NSBundle mainBundle] bundleIdentifier] account:account];
                
                HLLUserModel *userModel=[[HLLUserModel alloc] init];
                
                if (![HLLDataVerify verifyData:account regex:REGEX_EMAIL])
                {
                    HLLThirdAuthorizationModel *thirdModel=[[HLLThirdAuthorizationModel alloc] init];
                    thirdModel.id=[account intValue];
                    thirdModel.user_id=[password intValue];
                    userModel.thirds=(NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>*)@[thirdModel];
                }
                else
                {
                    userModel.email=account;
                    userModel.password=password;
                }
                
                authorizationUser=userModel;
            }
        }
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
    
    if ([self isThirdAuthorized])
    {
        HLLThirdAuthorizationModel *thirdAuthorizationModel=[self.authorizationUser.thirds objectAtIndex:0];
        
        // save account to keycain
        [SSKeychain setPassword:[NSString stringWithFormat:@"%d",thirdAuthorizationModel.user_id] forService:[[NSBundle mainBundle] bundleIdentifier] account:[NSString stringWithFormat:@"%d",thirdAuthorizationModel.id]];
    }
    else
    {
        // save account to keycain
        [SSKeychain setPassword:userModel.password forService:[[NSBundle mainBundle] bundleIdentifier] account:userModel.email];
    }
    
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
}

#pragma mark - Public methods

- (BOOL)isAuthorized
{
    return self.authorizationUser!=nil;
}

- (BOOL)isThirdAuthorized
{
    BOOL result=NO;
    
    if ([self isAuthorized])
    {
        result=(self.authorizationUser.thirds!=nil);// not null thirds=third authorize
//        result=(self.authorizationUser.password==nil);// null password=third authorize
    }
    
    return result;
}

#pragma mark - Login

- (void)stayOnline
{
    HLLUserModel *authorizationUserModel=self.authorizationUser;
    
    // no user data no login
    if (!authorizationUserModel)
    {
        return;
    }
    
    if ([self isThirdAuthorized])
    {
        HLLThirdAuthorizationModel *thirdModel=authorizationUserModel.thirds[0];
        
        NSString *thirdModelId=[NSString stringWithFormat:@"%d",thirdModel.id];
        NSString *thirdModelUserId=[NSString stringWithFormat:@"%d",thirdModel.user_id];
        
        // third login
        [HLLDataAPI userThirdLogin:nil
                           thirdId:thirdModelId
                       thirdUserId:thirdModelUserId
                thirdUserHeadImage:nil
              thirdUserDescription:nil
                        completion:nil
                           success:^(id json, JSONModelError *err) {
                               HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                               if (userModel)
                               {
                                   // get login user info
                                   HLLThirdAuthorizationModel* thirdModel = [[HLLThirdAuthorizationModel alloc] init];
                                   thirdModel.id=[thirdModelId intValue];
                                   thirdModel.user_id=[thirdModelUserId intValue];
                                   userModel.thirds=(NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>*)@[thirdModel];
                                   
                                   // set authorization user
                                   [HLLUserData sharedInstance].authorizationUser=userModel;
                                   
                                   // hud
                                   [HLLHud success:NSLocalizedString(@"Hud_Success_UserAuthorize_LoginCompleted",@"") detail:nil];
                                   
                                   // checkpoint
                                   [TestFlight passCheckpoint:CHECKPOINT_USER_THIRDLOGIN];
                               }
                           }
                             error:nil];
    }
    else
    {
        // TAG login
        [HLLDataAPI userLogin:nil
                        email:authorizationUserModel.email
                     password:authorizationUserModel.password
                   completion:nil
                      success:^(id json, JSONModelError *err) {
                          HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                          if (userModel)
                          {
                              // get login user info
                              userModel.email=authorizationUserModel.email;
                              userModel.password=authorizationUserModel.password;
                              
                              // set authorization user
                              [HLLUserData sharedInstance].authorizationUser=userModel;
                              
                              // hud
                              [HLLHud success:NSLocalizedString(@"Hud_Success_UserAuthorize_LoginCompleted",@"") detail:nil];
                              
                              // checkpoint
                              [TestFlight passCheckpoint:CHECKPOINT_USER_TAGLOGIN];
                          }
                      }
                        error:nil];
    }
}

@end
