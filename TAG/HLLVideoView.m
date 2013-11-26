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
    self.scrollView.scrollEnabled = NO;
    self.scrollView.bounces = NO;
}

- (void)loadVideo:(NSString*)url
{
    NSString *htmlTemplate=@"<iframe height=\"100%\" width=\"100%\" src=\"%@\" frameborder=0 allowfullscreen></iframe>";
    NSString *html = [NSString stringWithFormat:htmlTemplate, url];
    [self loadHTMLString:html baseURL:nil];
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
