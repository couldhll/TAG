//
//  HLLProductUnitView.m
//  TAG
//
//  Created by CouldHll on 13-9-24.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductUnitView.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation HLLProductUnitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
//        self.layer.masksToBounds = NO;
//        self.layer.cornerRadius = 8;
        
        // image view
        imageView = [[UIImageView alloc] init];
        imageView.frame=self.frame;
        [self addSubview:imageView];
        
//    // image view
//    imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.frame=self.frame;
//    [self addSubview:imageView];
    }
    return self;
}

- (void)loadImage:(NSString*)url
{
//    // use normal UIImageView
//    NSURL *imageUrl=[NSURL URLWithString:url];
//    NSData *imageData=[NSData dataWithContentsOfURL:imageUrl];
//    UIImage * image = [[UIImage alloc] initWithData:imageData];
//    [imageView setImage:image];
    
    // use normal UIImageView+WebCache
    [imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"Resource/Product/product_list_loading.jpg"]];
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
