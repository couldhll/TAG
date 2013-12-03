//
//  HLLCommentView.m
//  TAG
//
//  Created by CouldHll on 13-12-2.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCommentView.h"

#import "HLLCommentCell.h"

#define kCellHeight 30

@implementation HLLCommentView

@synthesize commentModels;

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
//    self.delegate=self;
}

#pragma mark - Property

- (void)setCommentModels:(NSArray<HLLCommentModel> *)models
{
    commentModels=models;
    [self reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [commentModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"HLLCommentCellIdentifier";
    
    // register cell
    static BOOL IsRegNib = NO;
    if (!IsRegNib)
    {
        [tableView registerNib:[UINib nibWithNibName:@"HLLCommentCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        IsRegNib = YES;
    }
    
    // get exist cell
    HLLCommentCell *cell = [self dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // if no cell create one
    if (!cell)
    {
        cell = [[HLLCommentCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
    }
    
    // load data
    HLLCommentModel *commentModel=[commentModels objectAtIndex:[indexPath row]];
    cell.userImageUrl=commentModel.user.thumbnail_image_url;
    cell.userName=commentModel.user.name;
    cell.comment=commentModel.comment;
    cell.commentTime=commentModel.created_at;
    
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
