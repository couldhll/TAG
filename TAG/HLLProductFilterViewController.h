//
//  HLLProductFilterViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-10.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLProductFilterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField  *keywordTextField;

@property (strong, nonatomic) IBOutlet HLLButton  *csButton;
@property (strong, nonatomic) IBOutlet HLLButton  *toButton;
@property (strong, nonatomic) IBOutlet HLLButton  *womenButton;
@property (strong, nonatomic) IBOutlet HLLButton  *menButton;
@property (strong, nonatomic) IBOutlet HLLButton  *kidButton;
@property (strong, nonatomic) IBOutlet HLLButton  *geekButton;
@property (strong, nonatomic) IBOutlet HLLButton  *cheapButton;
@property (strong, nonatomic) IBOutlet HLLButton  *expensiveButton;
@property (strong, nonatomic) IBOutlet HLLButton  *saleButton;
@property (strong, nonatomic) IBOutlet HLLButton  *comicButton;
@property (strong, nonatomic) IBOutlet HLLButton  *toonButton;
@property (strong, nonatomic) IBOutlet HLLButton  *freeButton;

@property (strong, nonatomic) IBOutlet UIButton  *searchButton;
@property (strong, nonatomic) IBOutlet UIButton  *clearButton;

- (IBAction)buttonPressed:(id)sender;

@end
