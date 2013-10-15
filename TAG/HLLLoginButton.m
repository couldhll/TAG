//
//  HLLLoginButton.m
//  TAG
//
//  Created by CouldHll on 13-10-15.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLLoginButton.h"

@implementation HLLLoginButton

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        [self initialize];
//    }
//    return self;
//}
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self initialize];
//    }
//    return self;
//}

- (void)initialize
{
    [super initialize];
    
    //  notification
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(changeLoginState:)
                                                 name: NOTIFICATION_CHANGELOGINSTATE
                                               object: nil];
}

#pragma mark - Login State

- (void)changeLoginState:(NSNotification *)notification
{
    // get login state
	NSNumber *logined=(NSNumber*)[notification.userInfo valueForKey:@"logined"];
    
    // set select button
    [self setLogined:[logined boolValue]];
}

- (void)setLogined:(BOOL)logined
{
    if (logined)
    {
        [self setTitle:@"Sign Out" forState:UIControlStateNormal];
    }
    else
    {
        [self setTitle:@"Sign In" forState:UIControlStateNormal];
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
