//
//  HLLSelectCell.h
//  TAG
//
//  Created by CouldHll on 13-12-3.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HLLSELECTCELL_CELLIDENTIFIER @"HLLSelectCellIdentifier"

@interface HLLSelectCell : UITableViewCell

@property (strong, nonatomic) HLLSelectButton *selectButton;
@property (strong, nonatomic) NSString *title;

@end
