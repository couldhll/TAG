//
//  HLLAPI.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataAPI.h"

#import <CocoaSecurity/CocoaSecurity.h>

@implementation HLLDataAPI

#pragma mark - Singleton methods

+ (HLLDataAPI *)sharedInstance
{
    static HLLDataAPI *sharedInstance = nil;
    static dispatch_once_t  oncePredicate;

    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });

    return sharedInstance;
}

#pragma mark - Public methods

- (BOOL)isAuthorized
{
    return YES;
}

- (void)save:(UIViewController*)sender
{
    [AppDelegate openViewController:@"HLLUserLoginViewController" sender:sender];
}

+ (void)userLogin:(UIView*)view email:(NSString*)email password:(NSString*)password completion:(JSONObjectBlock)completeBlock
{
    // params
    NSArray *paramsKeys=@[@"email",
                          @"password"];
    NSArray *paramsValues=@[email,
                            password];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_LOGIN_URL params:params completion:completeBlock];
}

+ (void)userRegister:(UIView*)view email:(NSString*)email name:(NSString*)name password:(NSString*)password completion:(JSONObjectBlock)completeBlock
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
    [self postJSONWithUrl:DATA_API_USER_REGISTER_URL params:params completion:completeBlock];
}

+ (void)userGetInfo:(UIView*)view completion:(JSONObjectBlock)completeBlock
{
    // send
    [self postJSONWithUrl:DATA_API_USER_GETINFO_URL params:nil completion:completeBlock];
}

+ (void)userUpdatePassword:(UIView*)view oldPassword:(NSString*)oldPassword newPassword:(NSString*)newPassword completion:(JSONObjectBlock)completeBlock
{
    // params
    NSArray *paramsKeys=@[@"old_password",
                          @"new_password"];
    NSArray *paramsValues=@[oldPassword,
                            newPassword];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_UPDATEPASSWORD_URL params:params completion:completeBlock];
}

+ (void)userThirdLogin:(UIView*)view thirdId:(NSString*)thirdId thirdUserId:(NSString*)thirdUserId completion:(JSONObjectBlock)completeBlock
{
    // params
    NSArray *paramsKeys=@[@"third_id",
                          @"user_id"];
    NSArray *paramsValues=@[thirdId,
                            thirdUserId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_THIRDLOGIN_URL params:params completion:completeBlock];
}

+ (void)userLogout:(UIView*)view completion:(JSONObjectBlock)completeBlock
{
    // send
    [self postJSONWithUrl:DATA_API_USER_LOGOUT_URL params:nil completion:completeBlock];
}


#pragma mark - Support methods

+ (void)postJSONWithUrl:(NSString*)url params:(NSDictionary *)params completion:(JSONObjectBlock)completeBlock
{
    [JSONHTTPClient postJSONFromURLWithString:url
                                       params:params
                                   completion:^(id json, JSONModelError* e) {
                                       // handle error
                                       HLLErrorModel* errorModel = [[HLLErrorModel alloc] initWithDictionary:json error:nil];
                                       if(errorModel)
                                       {
                                           // hud
                                           NSLog(@"error_description:%@",errorModel.error_description);
                                           [HLLHud error:errorModel.error_code detail:errorModel.error_description];
                                           
                                           return;
                                       }
                                       
                                       // handle success
                                       HLLSuccessModel* successModel = [[HLLSuccessModel alloc] initWithDictionary:json error:nil];
                                       if(errorModel)
                                       {
                                           // hud
                                           NSLog(@"result:%@",successModel.result?@"YES":@"NO");
                                           [HLLHud success];
                                       }
                                       
                                       // complete block
                                       if (completeBlock) completeBlock(json, e);
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
    [paramsKeys addObject:@"origrinal"];[paramsValues addObject:DATA_API_ORIGRINA_APP];
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