//
//  HLLDataAPI.h
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JSONModel/JSONHTTPClient.h>


#define DATA_API_BASE_URL @"http://api-tagoriginals-com-3u8vy4kocu16.runscope.net/"
//#define DATA_API_BASE_URL @"http://api.tagoriginals.com/"
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
 *	@brief	Data provider API.
 */
@interface HLLDataAPI : NSObject

/**
 *	@brief	Singleton methods.
 *
 *	@return	Singleton.
 */
+ (HLLDataAPI*)sharedInstance;


- (BOOL)isAuthorized;

- (void)userRegisterWithEmail:(NSString*)email name:(NSString*)name password:(NSString*)password completion:(JSONObjectBlock)completeBlock;



- (void)save:(UIViewController*)sender;

@end
