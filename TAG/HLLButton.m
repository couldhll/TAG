//
//  HLLButton.m
//  TAG
//
//  Created by CouldHll on 13-10-15.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLButton.h"

@implementation HLLButton

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
//    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
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
