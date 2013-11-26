//
//  HLLTOBuyViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLLProductBuyViewControllerDelegate;


@interface HLLProductBuyViewController : UIViewController

@property (assign, nonatomic) id <HLLProductBuyViewControllerDelegate> delegate;

@property (assign, nonatomic) HLLProductType productType;

@property (strong, nonatomic) IBOutlet UIButton *buyButton;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)buyButtonPressed:(id)sender;

@end


@protocol HLLProductBuyViewControllerDelegate <NSObject>
@required
- (void)viewController:(UIViewController *)viewController save:(UIButton *)button;

@optional
- (void)viewController:(UIViewController *)viewController buy:(UIButton *)button;

@end