//
//  HLLTracker.h
//  TAG
//
//  Created by CouldHll on 13-10-16.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Analytics/Analytics.h>

#define HLLTrackCategoryTypeNone @""
#define HLLTrackCategoryTypeButton @"Button"
#define HLLTrackCategoryTypeView @"Page"

#define HLLTrackActionTypeNone @""
#define HLLTrackActionTypeButtonPress @"ButtonPress"
#define HLLTrackActionTypeViewAppear @"PageEnter"
#define HLLTrackActionTypeViewDisappear @"PageLeave"

#define HLLTrackValueTypeNone @""
#define HLLTrackValueTypeOn @"On"
#define HLLTrackValueTypeOff @"Off"

@interface HLLTracker : NSObject

+ (void)eventWithCategory:(NSString*)category action:(NSString*)action object:(NSString*)object value:(NSString*)value;

@end
