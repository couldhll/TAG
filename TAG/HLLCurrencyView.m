//
//  HLLCurrencyView.m
//  TAG
//
//  Created by CouldHll on 13-11-25.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCurrencyView.h"

@implementation HLLCurrencyView

@synthesize titles;
@synthesize options;

- (void)initialize
{
    [super initialize];
    
    // init dropdown quick view
    self.titleBackgroundImage=[UIImage imageNamed:@"Resource/Common/Currency/title_background.png"];
    self.titleFont=[UIFont fontWithFont:APPLICATION_FONT style:UIFONT_BOLD];
    self.titleColor=APPLICATION_COLOR_BLUE;
    CGRect frame=self.titleLabel.frame;
    self.titleLabel.frame=CGRectMake(15, frame.origin.y, frame.size.width, frame.size.height);
    self.optionBackgroundImage=[UIImage imageNamed:@"Resource/Common/Currency/option_background.png"];
    self.optionFont=[UIFont fontWithName:APPLICATION_FONT_NAME size:12];
    self.optionColor=APPLICATION_COLOR_BLUE;
    self.title = CURRENCY_MAIN_NAME;
    
    // add title&option
    titles = @[CURRENCY_USD_NAME,CURRENCY_RMB_NAME];
    options = (NSArray<HLLCurrencyModel>*)@[[HLLCurrencyModel getUsdCurrency],[HLLCurrencyModel getRmbCurrency]];
    [self setSelectionOptions:options withTitles:titles];
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
