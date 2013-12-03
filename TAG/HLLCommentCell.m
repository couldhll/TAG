//
//  HLLCommentCell.m
//  TAG
//
//  Created by CouldHll on 13-12-2.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLCommentCell.h"

@implementation HLLCommentCell

@synthesize userImageUrl;
@synthesize userName;
@synthesize comment;
@synthesize commentTime;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Property

- (void)setUserImageUrl:(NSURL *)url
{
    userImageUrl=url;
    [self.userImageView setImageWithURL:userImageUrl placeholderImage:APPLICATION_IMAGE_LOADING_USER_UIIMAGE];
}

- (void)setUserName:(NSString*)name
{
    userName=name;
    self.userNameLabel.text=[NSString stringWithFormat:@"@%@",userName];
}

- (void)setComment:(NSString *)aComment
{
    comment=aComment;
    self.commentLabel.text=[NSString stringWithFormat:@"%@",comment];
}

- (void)setCommentTime:(NSDate*)time
{
    commentTime=time;
    self.commentTimeLabel.text=[NSString stringWithDateSinceNow:commentTime];
}

#pragma mark - Private Methods

@end
