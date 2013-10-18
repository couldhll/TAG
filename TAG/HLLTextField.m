//
//  HLLTextField.m
//  TAG
//
//  Created by CouldHll on 13-10-17.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTextField.h"

@implementation HLLTextField

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    
}

//- (void)drawPlaceholderInRect:(CGRect)rect
//{
//    // color
////    [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
//    
//    // font
//    UIFont *font=self.font;
//    font=[UIFont fontWithFont:font style:[UIFONT_LIGHT stringByAppendingString:UIFONT_OBLIQUE]];
//    
//    // draw
//    [self.placeholder drawInRect:rect withFont:font];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
