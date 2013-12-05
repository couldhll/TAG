//
//  HLLCommentCell.h
//  TAG
//
//  Created by CouldHll on 13-12-2.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HLLCOMMENTCELL_CELLIDENTIFIER @"HLLCommentCellIdentifier"

@interface HLLCommentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentTimeLabel;

@property (strong, nonatomic) NSURL *userImageUrl;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *comment;
@property (strong, nonatomic) NSDate *commentTime;

@end
