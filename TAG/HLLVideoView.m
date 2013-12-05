//
//  HLLVideoView.m
//  TAG
//
//  Created by CouldHll on 13-9-27.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLVideoView.h"

@implementation HLLVideoView

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
    self.opaque=NO;
    self.backgroundColor=[UIColor clearColor];
    
    self.scrollView.scrollEnabled = NO;
    self.scrollView.bounces = NO;
}

- (void)loadVideo:(NSString*)urlString
{
//    NSString *htmlTemplate=@"<iframe height=\"100%%\" width=\"100%%\" src=\"%@\" frameborder=0 allowfullscreen></iframe>";
//    NSString *html = [NSString stringWithFormat:htmlTemplate, url];
//    [self loadHTMLString:html baseURL:nil];
    
    // load url
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:url];
    [self loadRequest:urlRequest];
    
    // select button notification
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0"))
    {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(enterFullScreen:)
                                                     name: @"UIMoviePlayerControllerDidEnterFullscreenNotification"
                                                   object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(exitFullScreen:)
                                                     name: @"UIMoviePlayerControllerDidExitFullscreenNotification"
                                                   object: nil];
    }
}

- (void)enterFullScreen:(NSNotification *)notification
{
    AppDelegate.isFullScreen=YES;
}

- (void)exitFullScreen:(NSNotification *)notification
{
    AppDelegate.isFullScreen=NO;
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
