//
//  HLLHud.h
//  TAG
//
//  Created by CouldHll on 13-10-24.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLLHud : NSObject

+ (void)success:(NSString*)title detail:(NSString*)detail;
+ (void)error:(NSString*)title detail:(NSString*)detail;
+ (void)success:(UIView*)view title:(NSString*)title detail:(NSString*)detail;
+ (void)error:(UIView*)view title:(NSString*)title detail:(NSString*)detail;

@end
