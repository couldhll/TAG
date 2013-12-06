//
//  HLLSelectCell.m
//  TAG
//
//  Created by CouldHll on 13-12-3.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLSelectCell.h"

@implementation HLLSelectCell

@synthesize selectButton;
@synthesize title;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        selectButton=[[HLLSelectButton alloc] initWithFrame:self.frame];
        [self addSubview:selectButton];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    selectButton.selected=selected;
}

#pragma mark - Property

- (void)setTitle:(NSString *)aTitle
{
    title=aTitle;
    selectButton.titleLabel.text=title;
}

#pragma mark - Private Methods

@end
