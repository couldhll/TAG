//
//  HLLBorderButton.m
//  TAG
//
//  Created by CouldHll on 13-10-14.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLBorderButton.h"

@implementation HLLBorderButton

- (void)initialize
{
    [super initialize];
    
    // add border with color
    [self.layer setBorderWidth:1.0f];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    [self.layer setBorderColor:color];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
