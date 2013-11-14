//
//  HLLFowllowingUserListModel.h
//  TAG
//
//  Created by CouldHll on 13-11-14.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol HLLUserModel @end

@interface HLLFowllowingUserListModel : JSONModel

@property (strong, nonatomic) NSArray<HLLUserModel>* users;

@end
