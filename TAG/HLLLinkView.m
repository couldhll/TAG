//
//  HLLLinkView.m
//  TAG
//
//  Created by CouldHll on 13-11-29.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLLinkView.h"

#define kLinkButtonTag 1
#define kCellHeight 30

@implementation HLLLinkView

@synthesize linkModels;

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
    self.separatorStyle = NO;
    
    self.dataSource=self;
    self.delegate=self;
}

#pragma mark - Property

- (void)setLinkModels:(NSArray<HLLLinkModel> *)models
{
    linkModels=models;
    [self reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [linkModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CellIdentifier";
    
    // get exist cell
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // if no cell create one
    if (!cell)
    {
        cell = [[UITableViewCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
        
        HLLLinkButton *linkUnitView=[[HLLLinkButton alloc] init];
        linkUnitView.tag=kLinkButtonTag;
        
        [cell.contentView addSubview:linkUnitView];
    }
    
    // link button
    HLLLinkButton *linkButton=(HLLLinkButton *)[cell.contentView viewWithTag:kLinkButtonTag];
//    linkButton.isAutoOpenLink=NO;
    linkButton.titleLabel.font=[UIFont fontWithFont:APPLICATION_FONT style:UIFONT_BOLD];
    [linkButton setTitleColor:APPLICATION_COLOR_BLUE forState:UIControlStateNormal];
    // load data
    HLLLinkModel *linkModel=[linkModels objectAtIndex:[indexPath row]];
    linkButton.linkText=linkModel.name;
    linkButton.linkUrl=linkModel.url;
    [linkButton sizeToFit];// correct size
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // get link button
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    HLLLinkButton *linkButton=(HLLLinkButton *)[cell.contentView viewWithTag:kLinkButtonTag];
//    
//    // open link
//    [linkButton openLink];
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
