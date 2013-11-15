//
//  CSCreateNewCSViewController.h
//  TAG
//
//  Created by 陈顺 on 13-11-7.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCreateNewCSViewController : UIViewController{
}
@property (strong, nonatomic) IBOutlet UIButton*            btnHow;
@property (strong, nonatomic) IBOutlet UIButton*            btnCatalog;
@property (strong, nonatomic) IBOutlet UIButton*            btnFAQ;
@property (strong, nonatomic) IBOutlet UIButton*            btnHelp;
@property (strong, nonatomic) IBOutlet UIScrollView*        _scrollViewHow;
@property (strong, nonatomic) IBOutlet UIScrollView*        _scrollViewHelp;
@property (strong, nonatomic) IBOutlet UIView*              _viewCatalog;



- (IBAction)kickHowBtn:(id)sender;
- (IBAction)kickCatalogBtn:(id)sender;
- (IBAction)kickFAQBtn:(id)sender;
- (IBAction)kickHelpBtn:(id)sender;

@end
