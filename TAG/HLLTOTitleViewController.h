//
//  HLLTOTitleViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLTOTitleViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *brandImageView;
@property (strong, nonatomic) IBOutlet OHAttributedLabel *productTitleLabel;

@property (strong, nonatomic) NSURL *brandImageUrl;
@property (strong, nonatomic) NSString *brandName;
@property (strong, nonatomic) NSDate *productTime;

@end
