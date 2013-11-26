//
//  HLLLoginButton.m
//  TAG
//
//  Created by CouldHll on 13-10-15.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLLoginButton.h"

@implementation HLLLoginButton

@synthesize logined;

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
    
    // init data
    self.logined=NO;
    
    // notification
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(changeLoginState:)
                                                 name: NOTIFICATION_CHANGELOGINSTATE
                                               object: nil];
}

#pragma mark - Property

- (void)setLogined:(BOOL)isLogined
{
    logined = isLogined;
    
    if (logined)
    {
        [self setTitle:@"Sign Out" forState:UIControlStateNormal];
    }
    else
    {
        [self setTitle:@"Sign In" forState:UIControlStateNormal];
    }
}

#pragma mark - Login state

- (void)changeLoginState:(NSNotification *)notification
{
    // get login state
	NSNumber *loginState=(NSNumber*)[notification.userInfo valueForKey:@"logined"];
    
    // set select button
    [self setLogined:[loginState boolValue]];
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
