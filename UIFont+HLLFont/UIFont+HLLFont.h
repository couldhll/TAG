//
//  UIFont+HLLFont.h
//  TAG
//
//  Created by CouldHll on 13-10-17.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIFONT_BOLD @"Bold"
#define UIFONT_ITALIC @"Italic"
#define UIFONT_LIGHT @"Light"
#define UIFONT_OBLIQUE @"Oblique"

@interface UIFont (HLLFont)

+ (UIFont*)fontWithFont:(UIFont*)font style:(NSString*)style;

@end
