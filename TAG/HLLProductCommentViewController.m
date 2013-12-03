//
//  HLLProductCommentViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-21.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductCommentViewController.h"

@interface HLLProductCommentViewController () <UITextFieldDelegate>

@end

@implementation HLLProductCommentViewController

@synthesize productComments;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // textfield
    self.commentTextField.returnKeyType=UIReturnKeySend;
    self.commentTextField.delegate=self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Property

- (void)setProductComments:(NSArray<HLLCommentModel> *)comments
{
    productComments=comments;
    self.productCommentView.commentModels=productComments;
}

#pragma mark - Private Methods

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	switch (textField.returnKeyType)
    {
		case UIReturnKeySend:
            if (textField==self.commentTextField)
            {
                // delegate
                if([self.delegate respondsToSelector:@selector(viewController:addComment:)])
                {
                    [self.delegate viewController:self addComment:self.commentTextField.text];
                }
            }
			break;
		default:
			break;
	}
	return YES;
}

@end
