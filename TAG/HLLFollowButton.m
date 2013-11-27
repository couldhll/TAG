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
    
    // notification
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(changeLoginState:)
                                                 name: NOTIFICATION_CHANGELOGINSTATE
                                               object: nil];
}

#pragma mark - Property

- (void)setFollowed:(BOOL)isFollowed
{
    followed = isFollowed;
    
    if (followed)
    {
        [self setTitle:@"unFollow" forState:UIControlStateNormal];
    }
    else
    {
        [self setTitle:@"Follow" forState:UIControlStateNormal];
    }
}

#pragma mark - Login state

- (void)changeLoginState:(NSNotification *)notification
{
    // get login state
	NSNumber *loginState=(NSNumber*)[notification.userInfo valueForKey:@"logined"];
    
    // set select button
    [self setFollowed:[loginState boolValue]];
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
