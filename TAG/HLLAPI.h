//
//  HLLAPI.h
//  TAG
//
//  Created by CouldHll on 13-10-4.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLLAPI : NSObject

+(HLLAPI*)sharedInstance;

-(BOOL)isAuthorized;
-(void)save:(UIViewController*)sender;

@end
