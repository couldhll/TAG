//
//  main.m
//  TAG
//
//  Created by CouldHll on 13-9-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UI7Kit/UI7Kit.h>

#import "HLLAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        [UI7Kit patchIfNeeded];// Backport flat-style UIKit from iOS7 to iOS5+
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([HLLAppDelegate class]));
    }
}
