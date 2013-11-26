//
//  HLLProductUnitView.m
//  TAG
//
//  Created by CouldHll on 13-9-24.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductUnitView.h"

@implementation HLLProductUnitView

@synthesize productType;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    // background
    self.backgroundColor = [UIColor clearColor];
//        self.layer.masksToBounds = NO;
//        self.layer.cornerRadius = 8;
    
    // product image view
    self.productImageView = [[UIImageView alloc] init];
    self.productImageView.frame=self.frame;
    [self addSubview:self.productImageView];
    
    // type image view
    self.typeImageView = [[UIImageView alloc] init];
    self.typeImageView.frame=self.frame;
    [self addSubview:self.typeImageView];
}

- (void)loadImage:(NSString*)url
{
//    // use normal UIImageView
//    NSURL *imageUrl=[NSURL URLWithString:url];
//    NSData *imageData=[NSData dataWithContentsOfURL:imageUrl];
//    UIImage * image = [[UIImage alloc] initWithData:imageData];
//    [imageView setImage:image];
    
    // use normal UIImageView+WebCache
    [self.productImageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:APPLICATION_IMAGE_LOADING_PRODUCT_UIIMAGE];
}

#pragma mark - Property

- (void)setProductType:(HLLProductType)nowProductType
{
    productType=nowProductType;
    
    UIImage *image;
    
    switch (nowProductType)
    {
        case HLLProductTypeNone:
            image = [[UIImage alloc] init];
            break;
        case HLLProductTypeCS:
            image = [UIImage imageNamed:@"Resource/Product/List/type_cs_icon.png"];
            break;
        case HLLProductTypeFree:
            image = [UIImage imageNamed:@"Resource/Product/List/type_free_icon.png"];
            break;
        case HLLProductTypeSale:
            image = [UIImage imageNamed:@"Resource/Product/List/type_sale_icon.png"];
            break;
        default:
            break;
    }
    
    [self.typeImageView setImage:image];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
