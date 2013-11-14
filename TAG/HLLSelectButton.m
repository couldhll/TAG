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
    
//    [UIView animateWithDuration:0.8f
//                     animations:^(void){
                         if (selected)
                         {
                             self.backgroundColor=APPLICATION_COLOR_YELLOW;
                             self.titleLabel.font=[UIFont fontWithFont:self.titleLabel.font style:UIFONT_BOLD];
                         }
                         else
                         {
                             self.backgroundColor=[UIColor whiteColor];
                             self.titleLabel.font=[UIFont fontWithFont:self.titleLabel.font style:UIFONT_LIGHT];
                         }
//                     }];
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
