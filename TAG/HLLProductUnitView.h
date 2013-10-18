//
//  HLLProductUnitView.h
//  TAG
//
//  Created by CouldHll on 13-9-24.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLProductUnitView : UIView

@property (strong, nonatomic) UIImageView *productImageView;
@property (strong, nonatomic) UIImageView *typeImageView;

@property (assign, nonatomic) HLLProductType productType;

- (void)loadImage:(NSString*)url;

@end
