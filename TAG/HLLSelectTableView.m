//
//  HLLSelectTableView.m
//  TAG
//
//  Created by CouldHll on 13-12-3.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLSelectTableView.h"

#import "HLLSelectCell.h"

@implementation HLLSelectTableView

#pragma mark - Init

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
    // register cell
    static BOOL IsRegNib = NO;
    if (!IsRegNib)
    {
        [self registerNib:[UINib nibWithNibName:@"HLLSelectCell" bundle:nil] forCellReuseIdentifier:HLLSELECTCELL_CELLIDENTIFIER];
        IsRegNib = YES;
    }
    
    self.separatorStyle = NO;
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
