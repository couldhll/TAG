//
//  HLLProductCommentViewController.h
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLLProductCommentViewControllerDelegate;


@interface HLLProductCommentViewController : UIViewController

@property (assign, nonatomic) id <HLLProductCommentViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *commentTextField;
@property (strong, nonatomic) IBOutlet HLLCommentView *productCommentView;

@property (strong, nonatomic) NSArray<HLLCommentModel> *productComments;

@end


@protocol HLLProductCommentViewControllerDelegate <NSObject>
@required
- (void)viewController:(UIViewController *)viewController addComment:(NSString *)comment;

@end
