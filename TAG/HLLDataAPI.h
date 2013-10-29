//
//  HLLDataAPI.h
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JSONModel/JSONHTTPClient.h>


#pragma mark - Normal

#define DATA_API_SECURE_KEY @"tag1566850577@playpeli"
#define DATA_API_ORIGRINA_APP @"1"
#define DATA_API_ORIGRINA_WEB @"2"


#pragma mark - Normal

#define DATA_API_THIRD_SINAWEIBO @"1"
#define DATA_API_THIRD_QQSPACE @"2"
#define DATA_API_THIRD_FACEBOOK @"3"
#define DATA_API_THIRD_TWITTER @"4"

#pragma mark - Url

#ifdef DEBUG
#   define DATA_API_BASE_URL @"http://api-tagoriginals-com-3u8vy4kocu16.runscope.net/"
#else
#   define DATA_API_BASE_URL @"http://api.tagoriginals.com/"
#endif

#define DATA_API_USER_BASE_URL [DATA_API_BASE_URL stringByAppendingString:@"User/"]
#define DATA_API_USER_LOGIN_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"Login"]
#define DATA_API_USER_REGISTER_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"Register"]
#define DATA_API_USER_GETINFO_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"GetInfo"]
#define DATA_API_USER_UPDATEPASSWORD_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"UpdatePassword"]
#define DATA_API_USER_UPDATEINFO_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"UpdateInfo"]
#define DATA_API_USER_THIRDLOGIN_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"ThirdLogin"]
#define DATA_API_USER_BIND_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"Bind"]
#define DATA_API_USER_UNBIND_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"Unbind"]
#define DATA_API_USER_LOGOUT_URL [DATA_API_USER_BASE_URL stringByAppendingString:@"Logout"]


/**
 *	@brief Json error block.
 *
 *  @param err HLLErrorModel.
 */
typedef void (^JSONErrorBlock)(HLLErrorModel* err);



/**
 *	@brief	Data provider API.
 */
@interface HLLDataAPI : NSObject

/**
 *	@brief	Singleton methods.
 *
 *	@return	Singleton.
 */
+ (HLLDataAPI*)sharedInstance;

@property (strong, nonatomic) HLLUserModel *authorizationUser;

- (BOOL)isAuthorized;

+ (void)userRegister:(UIView*)view email:(NSString*)email name:(NSString*)name password:(NSString*)password completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;
+ (void)userLogin:(UIView*)view email:(NSString*)email password:(NSString*)password completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;
+ (void)userThirdLogin:(UIView*)view thirdId:(NSString*)thirdId thirdUserId:(NSString*)thirdUserId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;


- (void)save:(UIViewController*)sender;

@end