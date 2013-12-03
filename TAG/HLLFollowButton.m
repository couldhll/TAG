//
//  HLLFollowButton.m
//  TAG
//
//  Created by CouldHll on 13-11-27.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLFollowButton.h"

@implementation HLLFollowButton

@synthesize followed;

- (void)initialize
{
    [super initialize];
    
    // init data
    self.followed=NO;
}

#pragma mark - Property

- (void)setFollowed:(BOOL)isFollowed
{
    followed = isFollowed;
    
    if (followed)
    {
        [self setTitle:NSLocalizedString(@"Button_Follow_State_Follow_Text",@"") forState:UIControlStateNormal];
    }
    else
    {
        [self setTitle:NSLocalizedString(@"Button_Follow_State_Unfollow_Text",@"") forState:UIControlStateNormal];
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
