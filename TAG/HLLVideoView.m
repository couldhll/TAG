//
//  HLLVideoView.m
//  TAG
//
//  Created by CouldHll on 13-9-27.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLVideoView.h"

@implementation HLLVideoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView.scrollEnabled = NO;
        self.scrollView.bounces = NO;
    }
    return self;
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
