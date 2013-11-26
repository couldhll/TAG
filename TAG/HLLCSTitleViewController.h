//
//  HLLCSTitleViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-20.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLCSTitleViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *productNameLabel;
@property (strong, nonatomic) IBOutlet OHAttributedLabel *productBuildLabel;

@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *brandName;
@property (strong, nonatomic) NSString *userName;

@end
