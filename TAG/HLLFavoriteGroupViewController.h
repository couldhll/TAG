//
//  HLLFavoriteGroupViewController.h
//  TAG
//
//  Created by CouldHll on 13-12-3.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLFavoriteGroupViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet HLLSelectTableView *groupTableView;
@property (strong, nonatomic) IBOutlet HLLTextField *groupNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *groupAddButton;

- (IBAction)groupAddButtonPress:(id)sender;

@end
