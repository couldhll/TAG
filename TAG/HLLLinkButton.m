//
//  HLLLinkButton.m
//  TAG
//
//  Created by CouldHll on 13-11-29.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLLinkButton.h"

@implementation HLLLinkButton

@synthesize isAutoOpenLink;
@synthesize linkText;
@synthesize linkUrl;

- (void)initialize
{
    [super initialize];
    
    isAutoOpenLink=YES;
}

#pragma mark - Property

- (void)setLinkText:(NSString *)text
{
    linkText=text;
    self.titleLabel.text=linkText;
    [self setTitle:linkText forState:UIControlStateNormal];
}

- (void)setLinkUrl:(NSURL *)url
{
    linkUrl=url;
    
    if (isAutoOpenLink)
    {
        if (linkUrl!=nil)
        {
            [self addTarget:self action:@selector(openLink) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            [self removeTarget:self action:@selector(openLink) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - Action

- (void)openLink
{
    [[UIApplication sharedApplication] openURL:linkUrl];
//    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:linkUrl.absoluteString];
//    [self presentModalViewController:webViewController animated:YES completion:nil];
}

#pragma mark - Style

- (void)drawRect:(CGRect)rect
{
    CGRect textRect = self.titleLabel.frame;
    
    // need to put the line at top of descenders (negative value)
    CGFloat descender = self.titleLabel.font.descender;
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // set to same colour as text
    CGContextSetStrokeColorWithColor(contextRef, self.titleLabel.textColor.CGColor);
    
    CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height + descender);
    
    CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height + descender);
    
    CGContextClosePath(contextRef);
    CGContextDrawPath(contextRef, kCGPathStroke);
}

@end
