//
//  HLLTOBrandProductViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLLProductBrandProductViewControllerDelegate;


@interface HLLTOBrandProductViewController : UIViewController

@property (assign, nonatomic) id <HLLProductBrandProductViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet OHAttributedLabel *brandTitleLabel;
@property (strong, nonatomic) IBOutlet GMGridView *productGMGridView;

@property (strong, nonatomic) NSString *brandName;
@property (strong, nonatomic) NSArray<HLLProductModel> *brandProducts;

@end


@protocol HLLProductBrandProductViewControllerDelegate <NSObject>
@required
- (void)viewController:(UIViewController *)viewController select:(HLLProductModel *)productModel;

@end