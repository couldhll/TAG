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
    UIFont *boldFont=[UIFont fontWithName:@"Helvetica-Bold" size:18];
    UIFont *font=[UIFont fontWithName:@"Helvetica" size:18];
    font=[UIFont fontWithFont:boldFont style:UIFONT_BOLD];
    
    XCTAssert([boldFont.fontName isEqual:boldFont.fontName], @"bold font success.");
}

@end
