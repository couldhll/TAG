//
//  HLLDataVerify.h
//  TAG
//
//  Created by CouldHll on 13-10-31.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLLDataVerify : NSObject

+ (BOOL)verifyData:(NSString*)data regex:(NSString*)regex;
+ (BOOL)verifyDataWithTextField:(UITextField*)textField regex:(NSString*)regex hudTitle:(NSString*)hudTitle hudDetail:(NSString*)hudDetail;

+ (BOOL)verifyUserEmailWithTextField:(UITextField*)textField;
+ (BOOL)verifyUserNameWithTextField:(UITextField*)textField;
+ (BOOL)verifyUserPasswordWithTextField:(UITextField*)textField;

+ (BOOL)verifyUserPasswordSameWithTextField:(UITextField*)textField anotherTextField:(UITextField*)anotherTextField;

@end
