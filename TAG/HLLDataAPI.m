//
//  HLLAPI.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataAPI.h"

#import <CocoaSecurity/CocoaSecurity.h>


static NSMutableDictionary* needAuthorizationDictionary;

@implementation HLLDataAPI

#pragma mark - Init

+ (void)initialize
{
    // map with button and notification
    needAuthorizationDictionary=[NSMutableDictionary dictionary];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_GETINFO_URL];
    [needAuthorizationDictionary setValue:@YES forKey:DATA_API_USER_UPDATEINFO_URL];
}

#pragma mark - User

+ (void)userLogin:(UIView*)view email:(NSString*)email password:(NSString*)password completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // md5 password
    CocoaSecurityResult *passwordMd5 = [CocoaSecurity md5:password];
    
    // params
    NSArray *paramsKeys=@[@"email",
                          @"password"];
    NSArray *paramsValues=@[email,
                            passwordMd5.hexLower];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_LOGIN_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)userRegister:(UIView*)view email:(NSString*)email name:(NSString*)name password:(NSString*)password completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // md5 password
    CocoaSecurityResult *passwordMd5 = [CocoaSecurity md5:password];
    
    // params
    NSArray *paramsKeys=@[@"email",
                          @"name",
                          @"password"];
    NSArray *paramsValues=@[email,
                            name,
                            passwordMd5.hexLower];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_REGISTER_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)userGetInfo:(UIView*)view completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // send
    [self postJSONWithUrl:DATA_API_USER_GETINFO_URL params:nil completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)userUpdatePassword:(UIView*)view oldPassword:(NSString*)oldPassword newPassword:(NSString*)newPassword completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"old_password",
                          @"new_password"];
    NSArray *paramsValues=@[oldPassword,
                            newPassword];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_UPDATEPASSWORD_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)userThirdLogin:(UIView*)view thirdId:(NSString*)thirdId thirdUserId:(NSString*)thirdUserId thirdUserHeadImage:(NSString*)thirdUserHeadImage thirdUserDescription:(NSString*)thirdUserDescription completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"third_id",
                          @"user_id",
                          @"user_head_image",
                          @"user_description"];
    NSArray *paramsValues=@[thirdId,
                            thirdUserId,
                            thirdUserHeadImage,
                            thirdUserDescription];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_THIRDLOGIN_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)userLogout:(UIView*)view completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // send
    [self postJSONWithUrl:DATA_API_USER_LOGOUT_URL params:nil completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark - Product

+ (void)productGetInfo:(UIView*)view productId:(NSString*)productId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[productId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_PRODUCT_GETINFO_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)productGetList:(UIView*)view count:(NSString*)count page:(NSString*)page searchOption:(NSString*)searchOption searchKeyword:(NSString*)searchKeyword completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"count",
                          @"page",
                          @"search_option",
                          @"search_keyword"];
    NSArray *paramsValues=@[count,
                            page,
                            searchOption,
                            searchKeyword];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_PRODUCT_GETLIST_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark - Support methods

+ (void)postJSONWithUrl:(NSString*)url params:(NSDictionary *)params completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
//    BOOL needAuthorization=NO;
//    NSNumber *needAuthorizationValue=[needAuthorizationDictionary valueForKey:url];
//    if (needAuthorizationValue!=nil)
//    {
//        needAuthorization=needAuthorizationValue.boolValue;
//    }
//    if (needAuthorization)
//    {
//        [HLLUserData is]
//        
//        return;
//    }
    
    // send json
    [JSONHTTPClient postJSONFromURLWithString:url
                                       params:params
                                   completion:^(id json, JSONModelError* e) {
                                       // complete block
                                       if (completeBlock) completeBlock(json, e);
                                       
                                       // handle error
                                       HLLErrorModel* errorModel = [[HLLErrorModel alloc] initWithDictionary:json error:nil];
                                       if(errorModel)
                                       {
                                           // hud
                                           NSLog(@"ERROR:[%@]%@",errorModel.error_code,errorModel.error_description);
                                           [HLLHud error:errorModel.error_code detail:errorModel.error_description];
                                           
                                           // error block
                                           if (errorBlock) errorBlock(errorModel);
                                           
                                           return;
                                       }
                                       
                                       // handle success
                                       HLLSuccessModel* successModel = [[HLLSuccessModel alloc] initWithDictionary:json error:nil];
                                       if(errorModel)
                                       {
                                           // hud
                                           NSLog(@"result:%@",successModel.result?@"YES":@"NO");
                                           [HLLHud success:NSLocalizedString(@"Hud_Success_Completed",@"") detail:nil];
                                       }
                                       
                                       // success block
                                       if (successBlock) successBlock(json, e);
                                   }];
}

+ (NSDictionary*)createParams:(NSArray*)keys values:(NSArray*)values
{
    NSMutableArray *paramsKeys=[NSMutableArray arrayWithArray:keys];
    NSMutableArray *paramsValues=[NSMutableArray arrayWithArray:values];
    
    // time stamp
    NSTimeInterval timeInterval=[[NSDate date] timeIntervalSince1970];
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)timeInterval];
    
    // add to array
    [paramsKeys addObject:@"origrinal"];[paramsValues addObject:DATA_API_ORIGRINAL_APP];
    [paramsKeys addObject:@"rnd"];[paramsValues addObject:timeStamp];
    
    // secure string
    NSString *secureString=@"";
    for (NSString *key in paramsKeys)
    {
        NSUInteger valueIndex=[paramsKeys indexOfObject:key];
        NSString *value=[paramsValues objectAtIndex:valueIndex];
        secureString=[secureString stringByAppendingString:value];
//        NSLog(@"key:%@ \n value:%@ \n secureString:%@",key,value,secureString);
    }
    secureString=[secureString stringByAppendingString:DATA_API_SECURE_KEY];
    CocoaSecurityResult *secureStringMd5 = [CocoaSecurity md5:secureString];// md5 secure string
    
    // add to array
    [paramsKeys addObject:@"mdk"];[paramsValues addObject:secureStringMd5.hexLower];
    
    // return
    NSDictionary *secureParams=[NSDictionary dictionaryWithObjects:paramsValues forKeys:paramsKeys];
    return secureParams;
}

@end