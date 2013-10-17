//
//  UIFont+HLLFont.m
//  TAG
//
//  Created by CouldHll on 13-10-17.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIFont+HLLFont.h"

@interface UIFont_HLLFont : XCTestCase

@end

@implementation UIFont_HLLFont

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testBold
{
    UIFont *systemFont=[UIFont systemFontOfSize:[UIFont systemFontSize]];
    UIFont *boldFont=[UIFont systemFontOfSize:[UIFont systemFontSize]];
    [boldFont setBold:YES];
    
    
    
    XCTAssert([boldFont.fontName isEqual:systemFont.fontName], @"font with blod.");
}

@end
