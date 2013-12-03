//
//  HLLCommentView.h
//  TAG
//
//  Created by CouldHll on 13-12-2.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLLCommentModel @end

@interface HLLCommentView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray<HLLCommentModel> *commentModels;

@end
