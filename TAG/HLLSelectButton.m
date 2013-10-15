//
//  HLLSelectButton.m
//  TAG
//
//  Created by CouldHll on 13-10-14.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLSelectButton.h"

@implementation HLLSelectButton

- (void)initialize
{
    [super initialize];
    
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected)
    {
        self.backgroundColor=HexRGB(0xFFE719);
        self.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:self.titleLabel.font.pointSize];
    }
    else
    {
        self.backgroundColor=[UIColor whiteColor];
        self.titleLabel.font=[UIFont fontWithName:@"Helvetica-Light" size:self.titleLabel.font.pointSize];
    }
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
