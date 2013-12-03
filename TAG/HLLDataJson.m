//
//  HLLAPI.m
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataJson.h"

#import <CocoaSecurity/CocoaSecurity.h>


@implementation HLLDataJson

#pragma mark - User

#pragma mark User Authorization

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

+ (void)userThirdLogin:(UIView*)view thirdId:(NSString*)thirdId thirdUserId:(NSString*)thirdUserId thirdUserHeadImage:(NSString*)thirdUserHeadImage thirdUserDescription:(NSString*)thirdUserDescription completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    
    NSArray *paramsKeys=@[@"third_id",
                          @"user_id",
                          @"user_head_image",
                          @"user_description"];
    NSArray *paramsValues=@[thirdId,
                            thirdUserId,
                            thirdUserHeadImage==nil?@"":thirdUserHeadImage,
                            thirdUserDescription==nil?@"":thirdUserDescription];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_THIRDLOGIN_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)userLogout:(UIView*)view completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSDictionary *params=[self createParams:nil values:nil];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_LOGOUT_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark User Info

+ (void)userGetInfo:(UIView*)view userId:(NSString*)userId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[userId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_USER_GETINFO_URL params:params completion:completeBlock success:successBlock error:errorBlock];
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
    NSArray *paramsValues=@[count==nil?@"":count,
                            page==nil?@"":page,
                            searchOption==nil?@"":searchOption,
                            searchKeyword==nil?@"":searchKeyword];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_PRODUCT_GETLIST_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark - Comment

+ (void)commentGetList:(UIView*)view productId:(NSString*)productId count:(NSString*)count page:(NSString*)page completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id",
                          @"count",
                          @"page"];
    NSArray *paramsValues=@[productId,
                            count==nil?@"":count,
                            page==nil?@"":page];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COMMENT_GETLIST_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)commentAdd:(UIView*)view productId:(NSString*)productId comment:(NSString*)comment completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"comment",
                          @"id"];
    NSArray *paramsValues=@[comment,
                            productId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COMMENT_ADD_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)commentRemove:(UIView*)view commentId:(NSString*)commentId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[commentId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COMMENT_REMOTE_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark - Collect

#pragma mark Collect Group

+ (void)collectGetGroupInfo:(UIView*)view groupId:(NSString*)groupId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[groupId==nil?@"":groupId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COLLECT_GETGROUPINFO_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)collectGetGroupList:(UIView*)view completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSDictionary *params=[self createParams:nil values:nil];
    
    // send
    [self postJSONWithUrl:DATA_API_COLLECT_GETGROUPLIST_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)collectAddGroup:(UIView*)view name:(NSString*)name completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"name"];
    NSArray *paramsValues=@[name];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COLLECT_ADDGROUP_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)collectRemoveGroup:(UIView*)view groupId:(NSString*)groupId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[groupId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COLLECT_REMOVEGROUP_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark Collect Prodduct

+ (void)collectAddProduct:(UIView*)view productId:(NSString*)productId groupId:(NSString*)groupId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id",
                          @"group_id"];
    NSArray *paramsValues=@[productId,
                            groupId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COLLECT_ADD_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)collectRemoveProduct:(UIView*)view productId:(NSString*)productId groupId:(NSString*)groupId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id",
                          @"group_id"];
    NSArray *paramsValues=@[productId,
                            groupId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_COLLECT_REMOVE_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark - Fowllowing

#pragma mark Fowllowing Brand

+ (void)followingBrandGetList:(UIView*)view count:(NSString*)count page:(NSString*)page needDetail:(NSString*)needDetail completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"count",
                          @"page",
                          @"need_detail"];
    NSArray *paramsValues=@[count==nil?@"":count,
                            page==nil?@"":page,
                            needDetail==nil?@"":needDetail];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_FOLLOWING_BRAND_GETLIST_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)followingBrandAdd:(UIView*)view brandId:(NSString*)brandId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[brandId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_FOLLOWING_BRAND_ADD_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)followingBrandRemove:(UIView*)view brandId:(NSString*)brandId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[brandId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_FOLLOWING_BRAND_REMOVE_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark Fowllowing User

+ (void)followingUserGetList:(UIView*)view count:(NSString*)count page:(NSString*)page needDetail:(NSString*)needDetail completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"count",
                          @"page",
                          @"need_detail"];
    NSArray *paramsValues=@[count==nil?@"":count,
                            page==nil?@"":page,
                            needDetail==nil?@"":needDetail];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_FOLLOWING_USER_GETLIST_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)followingUserAdd:(UIView*)view userId:(NSString*)userId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[userId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_FOLLOWING_USER_ADD_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

+ (void)followingUserRemove:(UIView*)view userId:(NSString*)userId completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"id"];
    NSArray *paramsValues=@[userId];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_FOLLOWING_USER_REMOVE_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark - Tracking

+ (void)tracking:(UIView*)view ip:(NSString*)ip userId:(NSString*)userId category:(NSString*)category object:(NSString*)object action:(NSString*)action value:(NSString*)value time:(NSString*)time completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // params
    NSArray *paramsKeys=@[@"ip",
                          @"user_id",
                          @"category",
                          @"object",
                          @"action",
                          @"value",
                          @"time"];
    NSArray *paramsValues=@[ip,
                            userId==nil?@"":userId,
                            category==nil?@"":category,
                            object,
                            action,
                            value==nil?@"":value,
                            time];
    NSDictionary *params=[self createParams:paramsKeys values:paramsValues];
    
    // send
    [self postJSONWithUrl:DATA_API_TRACK_TRACKING_URL params:params completion:completeBlock success:successBlock error:errorBlock];
}

#pragma mark - Support methods

+ (void)postJSONWithUrl:(NSString*)url params:(NSDictionary *)params completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    // post json
    [JSONHTTPClient postJSONFromURLWithString:url
                                       params:params
                                   completion:^(id json, JSONModelError* e) {
                                       // complete block
                                       if (completeBlock) completeBlock(json, e);
                                       
                                       // handle error
                                       HLLErrorModel* errorModel = [[HLLErrorModel alloc] initWithDictionary:json error:nil];
                                       if(errorModel)
                                       {
                                           // error block
                                           NSLog(@"ERROR:[%@]%@",errorModel.error_code,errorModel.error_description);
                                           if (errorBlock) errorBlock(errorModel);
                                           
                                           return;
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