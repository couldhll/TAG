//
//  HLLUserModel.m
//  TAG
//
//  Created by CouldHll on 13-10-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLUserModel.h"

@implementation HLLUserModel

- (BOOL)canTAGAuthorize
{
    BOOL result=NO;
    
    if (self.email!=nil&&self.password!=nil)
    {
        result=YES;
    }
    
    return result;
}

- (BOOL)canThirdAuthorize
{
    BOOL result=NO;
    
    if (self.thirds!=nil)
    {
        if (self.thirds.count!=0)
        {
            result=YES;
        }
    }
    
    return result;
}

@end
