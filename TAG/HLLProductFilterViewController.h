//
//  HLLProductFilterViewController.h
//  TAG
//
//  Created by CouldHll on 13-10-10.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLLProductFilterViewControllerDelegate;


@interface HLLProductFilterViewController : UIViewController

@property (assign,nonatomic) id<HLLProductFilterViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *searchText;
@property (strong, nonatomic) NSMutableArray *filterArray;

@property (strong, nonatomic) IBOutlet UITextField  *searchTextField;

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

- (IBAction)filterButtonPressed:(id)sender;
- (IBAction)searchButtonPressed:(id)sender;
- (IBAction)clearButtonPressed:(id)sender;

- (IBAction)textFieldDoneEditing:(id)sender;

@end


@protocol HLLProductFilterViewControllerDelegate <NSObject>
@required

- (void)productFilterViewController:(HLLProductFilterViewController*)productFilterViewController filter:(NSMutableArray*)filter keyword:(NSString*)keyword;

@end
