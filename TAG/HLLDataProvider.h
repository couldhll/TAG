//
//  HLLDataProvider.h
//  TAG
//
//  Created by CouldHll on 13-11-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLDataJson.h"

@interface HLLDataProvider : HLLDataJson

+ (void)userLoginWithModel:(HLLUserModel*)userModel completion:(JSONObjectBlock)completeBlock success:(JSONObjectBlock)successBlock error:(JSONErrorBlock)errorBlock;

@end
