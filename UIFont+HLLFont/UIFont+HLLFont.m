//
//  UIFont+HLLFont.m
//  TAG
//
//  Created by CouldHll on 13-10-17.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "UIFont+HLLFont.h"

@implementation UIFont (HLLFont)

+ (UIFont*)fontWithFont:(UIFont*)font style:(NSString*)style
{
    NSString *fontName=font.fontName;
    
    // remove "." and "Interface"
    fontName=[fontName stringByReplacingOccurrencesOfString:@"." withString:@""];
    fontName=[fontName stringByReplacingOccurrencesOfString:@"Interface" withString:@""];
    
    // remove "-xxx"
    NSRange styleRang=[fontName rangeOfString:@"-"];
    if(styleRang.location!=0&&styleRang.length!=0)
    {
        fontName = [fontName substringWithRange:NSMakeRange(0, styleRang.location)];
    }
    
    // add style
    fontName=[fontName stringByAppendingString:[@"-" stringByAppendingString:style]];
    
    return [UIFont fontWithName:fontName size:font.pointSize];
}

@end
