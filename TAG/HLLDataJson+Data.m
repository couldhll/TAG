//
//  HLLDataJson+Data.m
//  TAG
//
//  Created by CouldHll on 13-11-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataJson+Data.h"

@implementation HLLDataJson (Data)

#pragma mark - User

+ (void)userLoginWithModel:(HLLUserModel*)userModel completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock
{
    if (!userModel)
    {
        return;
    }
    
    if ([userModel canTAGAuthorize])
    {
        NSString *email=userModel.email;
        NSString *password=userModel.password;
        
        // TAG login
        [self userLogin:nil
                             email:email
                          password:password
                        completion:completeBlock
                           success:successBlock
                             error:errorBlock];
    }
    else if ([userModel canThirdAuthorize])
    {
        HLLThirdAuthorizationModel *thirdModel=userModel.thirds[0];
        
        NSString *thirdModelId=[NSString stringWithFormat:@"%d",thirdModel.id];
        NSString *thirdModelUserId=thirdModel.user_id;
        NSString *thirdModelUserHeadImage=thirdModel.user_head_image;
        NSString *thirdModelUserDescription=thirdModel.user_description;
        
        // third login
        [self userThirdLogin:nil
                                thirdId:thirdModelId
                            thirdUserId:thirdModelUserId
                     thirdUserHeadImage:thirdModelUserHeadImage
                   thirdUserDescription:thirdModelUserDescription
                             completion:completeBlock
                                success:successBlock
                                  error:errorBlock];
    }
}

@end
