//
//  CSUserFavoritesViewController.h
//  TAG
//
//  Created by 陈顺 on 13-10-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSUserFavoritesViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
     NSMutableArray *dataArray;
}

@property (strong, nonatomic) IBOutlet UIButton*            allFav;
@property (strong, nonatomic) IBOutlet UIButton*            collection;
@property (strong, nonatomic) IBOutlet UITableView*         tableView;
@property (strong, nonatomic) IBOutlet UITableViewCell*     tableViewCell;
@property (strong, nonatomic) IBOutlet UIView*              viewMask;
@property (strong, nonatomic) IBOutlet UITextField*         textInputCollection;


//touch all
- (IBAction)buttonAllPressed:(id)sender;
//touch connection
- (IBAction)buttonCollectionPressed:(id)sender;
//touch addconnectionbutton
- (IBAction)butoonAddCollectPressed:(id)sender;

@property (nonatomic, retain) NSMutableArray *dataArray;

@end
