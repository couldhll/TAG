//
//  HLLUserData.h
//  TAG
//
//  Created by CouldHll on 13-10-31.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLLUserData : NSObject

/**
 *	@brief	Singleton methods.
 *
 *	@return	Singleton.
 */
+ (HLLUserData*)sharedInstance;

@property (strong, nonatomic) HLLUserModel *authorizationUser;

- (BOOL)isAuthorized;
- (BOOL)isThirdAuthorized;

- (void)stayOnline;

@end
