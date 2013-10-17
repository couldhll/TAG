//
//  UIFont+HLLFont.m
//  TAG
//
//  Created by CouldHll on 13-10-17.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "UIFont+HLLFont.h"

#define UIFONT_BOLD @"Bold"
#define UIFONT_ITALIC @"Italic"
#define UIFONT_LIGHT @"Light"
#define UIFONT_OBLIQUE @"Oblique"

@implementation UIFont (HLLFont)

+ (UIFont*)boldFont:(UIFont*)font
{
    NSString *fontName=font.fontName;
    NSRange startRange=[fontName rangeOfString:@"."];
    NSRange endRange=[fontName rangeOfString:@"Interface"];
    fontName = [fontName substringWithRange:NSMakeRange(startRange.location+1, endRange.location)];
    fontName=[fontName stringByAppendingString:UIFONT_BOLD];
    
    return [UIFont fontWithName:fontName size:font.pointSize];
}

@end
