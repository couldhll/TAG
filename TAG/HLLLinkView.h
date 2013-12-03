//
//  HLLLinkView.h
//  TAG
//
//  Created by CouldHll on 13-11-29.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLLLinkModel @end

@interface HLLLinkView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray<HLLLinkModel> *linkModels;

@end
