//
//  HLLProductListModel.h
//  TAG
//
//  Created by CouldHll on 13-10-29.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HLLProductListModel : JSONModel

@property (strong, nonatomic) NSArray<HLLThirdAuthorizationModel>* thirds;

@end
