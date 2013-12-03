//
//  HLLCSBrandViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLCSBrandViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *brandImageView;
@property (strong, nonatomic) IBOutlet HLLFollowButton *brandFollowButton;
@property (strong, nonatomic) IBOutlet UILabel *brandNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *brandDescriptionLabel;
@property (strong, nonatomic) IBOutlet HLLLinkView *brandLinkView;

@property (strong, nonatomic) NSURL *brandImageUrl;
@property (assign, nonatomic) BOOL brandFollowed;
@property (strong, nonatomic) NSString *brandName;
@property (strong, nonatomic) NSString *brandDescription;
@property (strong, nonatomic) NSArray<HLLLinkModel> *brandLinks;

@property (assign, nonatomic) int brandId;// for follow

- (IBAction)brandFollowButtonPressed:(id)sender;

@end