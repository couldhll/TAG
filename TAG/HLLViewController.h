//
//  HLLViewController.h
//  TAG
//
//  Created by CouldHll on 13-9-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLViewController : UIViewController

@property (strong, nonatomic, readonly) NSString *className;
@property (strong, nonatomic) NSString *trackingName;

- (void)back;

@end
