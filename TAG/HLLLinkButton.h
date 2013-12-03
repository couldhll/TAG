//
//  HLLLinkButton.h
//  TAG
//
//  Created by CouldHll on 13-11-29.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLButton.h"

@interface HLLLinkButton : HLLButton

@property (assign, nonatomic) BOOL isAutoOpenLink;

@property (strong, nonatomic) NSString *linkText;
@property (strong, nonatomic) NSURL *linkUrl;

- (void)openLink;

@end
