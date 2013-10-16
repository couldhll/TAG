//
//  HLLTracker.h
//  TAG
//
//  Created by CouldHll on 13-10-16.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HLLTrackActionTypeNone @"HLLTrackActionTypeNone"
#define HLLTrackActionTypeButtonPress @"HLLTrackActionTypeButtonPress"
#define HLLTrackActionTypeViewAppear @"HLLTrackActionTypeViewAppear"
#define HLLTrackActionTypeViewDisappear @"HLLTrackActionTypeViewDisappear"

@interface HLLTracker : NSObject

+ (void)send:(NSString*)object action:(NSString*)action value:(NSString*)value category:(NSString*)category;

@end
