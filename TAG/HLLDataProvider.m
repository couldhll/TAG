//
//  HLLDataProvider.m
//  TAG
//
//  Created by CouldHll on 13-11-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataProvider.h"
#import "HLLDataJson+Data.h"

@implementation HLLDataProvider

#pragma mark - User

+ (void)userLoginWithModel:(HLLUserModel*)userModel completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    if (!userModel)
    {
        return;
    }
    
    // login
    [super userLoginWithModel:userModel
                   completion:completeBlock
                      success:successBlock
                        error:errorBlock];
}

+ (void)userLogin:(UIView*)view email:(NSString*)email password:(NSString*)password completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // TAG login
    [super userLogin:view
               email:email
            password:password
                   completion:completeBlock
                      success:^(id json, JSONModelError *e) {
                          // handle success
                          HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                          if (userModel)
                          {
                              // get login user info
                              userModel.email=email;
                              userModel.password=password;
                              
                              // save user data
                              [HLLUserData sharedInstance].authorizationUser=userModel;
                              
                              // hud
                              [HLLHud success:NSLocalizedString(@"Hud_Success_UserAuthorize_LoginCompleted",@"") detail:nil];
                              
                              // checkpoint
                              [TestFlight passCheckpoint:CHECKPOINT_USER_TAGLOGIN];
                              
                              // login notification
                              NSMutableDictionary *notificationuUserInfo=[NSMutableDictionary dictionary];
                              [notificationuUserInfo setValue:@YES forKey:@"logined"];
                              [notificationuUserInfo setValue:self forKey:@"sender"];
                              [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGELOGINSTATE object:self userInfo:notificationuUserInfo];
                          }
                          
                          // success block
                          if (successBlock) successBlock(json, e);
                      }
                        error:errorBlock];
}

+ (void)userThirdLogin:(UIView*)view thirdId:(NSString*)thirdId thirdUserId:(NSString*)thirdUserId thirdUserHeadImage:(NSString*)thirdUserHeadImage thirdUserDescription:(NSString*)thirdUserDescription completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // third login
    [super userThirdLogin:view
                  thirdId:thirdId
              thirdUserId:thirdUserId
       thirdUserHeadImage:thirdUserHeadImage
     thirdUserDescription:thirdUserDescription
               completion:completeBlock
                  success:^(id json, JSONModelError *e) {
                      HLLUserModel* userModel = [[HLLUserModel alloc] initWithDictionary:json error:nil];
                      if (userModel)
                      {
                          // get login user info
                          HLLThirdAuthorizationModel* thirdModel = [[HLLThirdAuthorizationModel alloc] init];
                          thirdModel.id=[thirdId intValue];
                          thirdModel.user_id=thirdUserId;
                          thirdModel.user_head_image=thirdUserHeadImage;
                          thirdModel.user_description=thirdUserDescription;
                          userModel.thirds=(NSArray<HLLThirdAuthorizationModel,Optional,ConvertOnDemand>*)@[thirdModel];
                          
                          // save user data
                          [HLLUserData sharedInstance].authorizationUser=userModel;
                      }
                      // hud
                      [HLLHud success:NSLocalizedString(@"Hud_Success_UserAuthorize_LoginCompleted",@"") detail:nil];
                      
                      // checkpoint
                      [TestFlight passCheckpoint:CHECKPOINT_USER_THIRDLOGIN];
                      
                      // login notification
                      NSMutableDictionary *notificationuUserInfo=[NSMutableDictionary dictionary];
                      [notificationuUserInfo setValue:@YES forKey:@"logined"];
                      [notificationuUserInfo setValue:self forKey:@"sender"];
                      [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGELOGINSTATE object:self userInfo:notificationuUserInfo];
                      
                      // success block
                      if (successBlock) successBlock(json, e);
                  }
                    error:errorBlock];
}

+ (void)userLogout:(UIView*)view completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // logout
    [super userLogout:view
           completion:completeBlock
              success:^(id json, JSONModelError *e) {
                  // save user data
                  [HLLUserData sharedInstance].authorizationUser=nil;
                  
                  // hud
                  [HLLHud success:NSLocalizedString(@"Hud_Success_UserAuthorize_LogoutCompleted",@"") detail:nil];
                  
                  // checkpoint
                  [TestFlight passCheckpoint:CHECKPOINT_USER_LOGOUT];
                  
                  // login button notification
                  NSMutableDictionary *notificationuUserInfo=[NSMutableDictionary dictionary];
                  [notificationuUserInfo setValue:@NO forKey:@"logined"];
                  [notificationuUserInfo setValue:self forKey:@"sender"];
                  [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CHANGELOGINSTATE object:self userInfo:notificationuUserInfo];
                  
                  // success block
                  if (successBlock) successBlock(json, e);
              }
                error:errorBlock];
}

#pragma mark - Support methods

+ (void)postJSONWithUrl:(NSString*)url params:(NSDictionary *)params completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // hud loading
    [HLLHud loading:NSLocalizedString(@"Hud_Loading",@"") detail:nil];
    
    // post data
    [super postJSONWithUrl:url
                    params:params
                completion:^(id json, JSONModelError* e) {
                    // close loading
                    [HLLHud hideHud];
                    
                    // complete block
                    if (completeBlock) completeBlock(json, e);
                }
                   success:^(id json, JSONModelError* e) {
                       // handle success
                       HLLSuccessModel* successModel = [[HLLSuccessModel alloc] initWithDictionary:json error:nil];
                       if(successModel)
                       {
                           // hud
                           NSLog(@"result:%@",successModel.result?@"YES":@"NO");
//                           [HLLHud success:NSLocalizedString(@"Hud_Success_Completed",@"") detail:nil];
                       }
                       
                       // success block
                       if (successBlock) successBlock(json, e);
                   }
                     error:^(HLLErrorModel* err) {
                         // handle error
                         HLLErrorModel* errorModel=err;
                         if(err)
                         {
                             // hud
                             [HLLHud error:errorModel.error_code detail:errorModel.error_description];
                         }
                         
                         // error block
                         if (errorBlock) errorBlock(err);
                     }];
}

@end
