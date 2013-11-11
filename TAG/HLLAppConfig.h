//
//  HLLAppConfig.h
//  TAG
//
//  Created by CouldHll on 13-10-14.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#ifndef TAG_HLLAppConfig_h
#define TAG_HLLAppConfig_h

#pragma mark - Import

#import "HLLComponent.h"

#import "HLLModel.h"
#import "HLLDataAuthorizeProvider.h"
#import "HLLDataVerify.h"
#import "HLLUserData.h"

#import "HLLTracker.h"


#pragma mark - TestFlight Log

# undef NSLog
#if DEBUG
#   define NSLog(__FORMAT__, ...) TFLog((@"%s [Line %d] " __FORMAT__), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define NSLog(__FORMAT__, ...) nil
#endif


#pragma mark - Notification

#define NOTIFICATION_OPENVIEWCONTROLLER @"OpenViewController"
#define NOTIFICATION_CHANGELOGINSTATE @"ChangeLoginState"


#pragma mark - Color

#define APPLICATION_COLOR_BLUE HexRGB(0x174C9C)
#define APPLICATION_COLOR_YELLOW HexRGB(0xFFE719)


#pragma mark - Font

#define APPLICATION_FONT_NAME @"Helvetica"
#define APPLICATION_FONT_SIZE 18

#define APPLICATION_FONT [UIFont fontWithName:APPLICATION_FONT_NAME size:APPLICATION_FONT_SIZE]
#define APPLICATION_BOLD_FONT [UIFont fontWithName:[APPLICATION_FONT_NAME stringByAppendingString:@"-Bold"] size:APPLICATION_FONT_SIZE]
#define APPLICATION_BOLD_OBLIQUE_FONT [UIFont fontWithName:[APPLICATION_FONT_NAME stringByAppendingString:@"-Oblique"] size:APPLICATION_FONT_SIZE]


#pragma mark - App Delegate

#define AppDelegate (HLLAppDelegate *)[[UIApplication sharedApplication] delegate]


#pragma mark - Regular Expression

#define REGEX_ACCOUNT @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$" // alphabet begin, 5~16 length, allow alphabet+number+"_"
#define REGEX_PASSWORD @"[a-zA-Z0-9]{6,16}$" // 6~16 length, allow alphabet+number


#pragma mark - Checkpoint

#define CHECKPOINT_USER_THIRDLOGIN @"Third Login OK."
#define CHECKPOINT_USER_TAGLOGIN @"TAG Login OK."
#define CHECKPOINT_USER_LOGOUT @"User Logout OK."
#define CHECKPOINT_USER_REGISTER @"User Register OK."


#pragma mark - Enum

typedef enum {
    HLLProductTypeNone=DATA_API_PRODUCT_TYPE_TO,
    HLLProductTypeCS=DATA_API_PRODUCT_TYPE_CS,
    HLLProductTypeSale=DATA_API_PRODUCT_TYPE_SALE,
    HLLProductTypeFree=DATA_API_PRODUCT_TYPE_FREE
} HLLProductType;

#endif
