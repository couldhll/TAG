//
//  HLLCSUserViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLCSUserViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) IBOutlet HLLFollowButton *userFollowButton;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *userDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *productSuccessRateLabel;
@property (strong, nonatomic) IBOutlet UILabel *productFavoritedCountLabel;

@property (strong, nonatomic) NSURL *userImageUrl;
@property (assign, nonatomic) BOOL userFollowed;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userDescription;
@property (assign, nonatomic) float productSuccessRate;
@property (assign, nonatomic) int productFavoritedCount;

@property (assign, nonatomic) int userId;// for follow

@end
