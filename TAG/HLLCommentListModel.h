//
//  HLLCommentListModel.h
//  TAG
//
//  Created by CouldHll on 13-11-13.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HLLCommentModel @end

@interface HLLCommentListModel : JSONModel

@property (strong, nonatomic) NSArray<HLLCommentModel>* comments;

@end
