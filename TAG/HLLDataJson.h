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


#pragma mark - Send Original

#define DATA_API_ORIGRINAL_APP @"1"
#define DATA_API_ORIGRINAL_WEB @"2"


#pragma mark - Third Authorization

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

#define DATA_API_PRODUCT_BASE_URL [DATA_API_BASE_URL stringByAppendingString:@"Product/"]
#define DATA_API_PRODUCT_GETLIST_URL [DATA_API_PRODUCT_BASE_URL stringByAppendingString:@"GetList"]
#define DATA_API_PRODUCT_GETINFO_URL [DATA_API_PRODUCT_BASE_URL stringByAppendingString:@"GetInfo"]



/**
 *	@brief Json error block.
 *
 *  @param err HLLErrorModel.
 */
typedef void (^JSONErrorBlock)(HLLErrorModel* err);



/**
 *	@brief	JSON data provider.
 */
@interface HLLDataJson : NSObject

+ (void)userRegister:(UIView*)view email:(NSString*)email name:(NSString*)name password:(NSString*)password completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;
+ (void)userLogin:(UIView*)view email:(NSString*)email password:(NSString*)password completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;
+ (void)userThirdLogin:(UIView*)view thirdId:(NSString*)thirdId thirdUserId:(NSString*)thirdUserId thirdUserHeadImage:(NSString*)thirdUserHeadImage thirdUserDescription:(NSString*)thirdUserDescription completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;
+ (void)userLogout:(UIView*)view completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;

+ (void)productGetInfo:(UIView*)view productId:(NSString*)productId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;
+ (void)productGetList:(UIView*)view count:(NSString*)count page:(NSString*)page searchOption:(NSString*)searchOption searchKeyword:(NSString*)searchKeyword completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;

+ (void)postJSONWithUrl:(NSString*)url params:(NSDictionary *)params completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;
+ (NSDictionary*)createParams:(NSArray*)keys values:(NSArray*)values;

@end
