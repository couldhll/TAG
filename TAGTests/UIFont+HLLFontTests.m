//
//  UIFont_HLLFontTests.m
//  TAG
//
//  Created by CouldHll on 13-10-17.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIFont+HLLFont.h"

@interface UIFont_HLLFontTests : XCTestCase

@end

@implementation UIFont_HLLFontTests

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
    UIFont *orignalFont=[UIFont fontWithName:@"Helvetica" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"Helvetica-Bold" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:UIFONT_BOLD];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}

- (void)testLight
{
    UIFont *orignalFont=[UIFont fontWithName:@"Helvetica" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"Helvetica-Light" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:UIFONT_LIGHT];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}

- (void)testOblique
{
    UIFont *orignalFont=[UIFont fontWithName:@"Helvetica" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"Helvetica-Oblique" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:UIFONT_OBLIQUE];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}

- (void)testBoldOblique
{
    UIFont *orignalFont=[UIFont fontWithName:@"Helvetica" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"Helvetica-BoldOblique" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:[UIFONT_BOLD stringByAppendingString:UIFONT_OBLIQUE]];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}

- (void)testLightOblique
{
    UIFont *orignalFont=[UIFont fontWithName:@"Helvetica" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"Helvetica-LightOblique" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:[UIFONT_LIGHT stringByAppendingString:UIFONT_OBLIQUE]];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}

- (void)testItalic
{
    UIFont *orignalFont=[UIFont fontWithName:@"HelveticaNeue" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"HelveticaNeue-Italic" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:UIFONT_ITALIC];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}

- (void)testBoldItalic
{
    UIFont *orignalFont=[UIFont fontWithName:@"HelveticaNeue" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"HelveticaNeue-BoldItalic" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:[UIFONT_BOLD stringByAppendingString:UIFONT_ITALIC]];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}

- (void)testLightItalic
{
    UIFont *orignalFont=[UIFont fontWithName:@"HelveticaNeue" size:18];
    UIFont *styleFont=[UIFont fontWithName:@"HelveticaNeue-LightItalic" size:18];
    UIFont *hllFont=[UIFont fontWithFont:orignalFont style:[UIFONT_LIGHT stringByAppendingString:UIFONT_ITALIC]];
    
    XCTAssertTrue([hllFont.fontName isEqual:styleFont.fontName], @"hllFont[%@] is not styleFont[%@].",hllFont.fontName,styleFont.fontName);
}


@end
