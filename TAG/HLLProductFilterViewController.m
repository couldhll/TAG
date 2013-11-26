//
//  HLLProductFilterViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-10.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductFilterViewController.h"

@interface HLLProductFilterViewController ()
{
    NSMutableArray *filterButtonArray;
}

@end

@implementation HLLProductFilterViewController

@synthesize searchText;
@synthesize filterArray;

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
    
    // init button information
    self.csButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_CS];
    self.toButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_TO];
    self.womenButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_WOMEN];
    self.menButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_MEN];
    self.kidButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_KIDS];
    self.geekButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_GEEK];
    self.cheapButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_$];
    self.expensiveButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_$$];
    self.saleButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_SALE];
    self.comicButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_COMICS];
    self.toonButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_TOONS];
    self.freeButton.information=[NSString stringWithFormat:@"%d",DATA_API_PRODUCT_TYPE_FREE];
    
    // init button array
    filterButtonArray=[NSMutableArray array];
    [filterButtonArray addObject:self.csButton];
    [filterButtonArray addObject:self.toButton];
    [filterButtonArray addObject:self.womenButton];
    [filterButtonArray addObject:self.menButton];
    [filterButtonArray addObject:self.kidButton];
    [filterButtonArray addObject:self.geekButton];
    [filterButtonArray addObject:self.cheapButton];
    [filterButtonArray addObject:self.expensiveButton];
    [filterButtonArray addObject:self.saleButton];
    [filterButtonArray addObject:self.comicButton];
    [filterButtonArray addObject:self.toonButton];
    [filterButtonArray addObject:self.freeButton];
    
    // init filter data
    filterArray=[NSMutableArray array];
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

- (NSString*)searchText
{
    return self.searchTextField.text;
}

- (void)setSearchText:(NSString*)text
{
    self.searchTextField.text=text;
}

#pragma mark - Actions

- (IBAction)filterButtonPressed:(id)sender
{
    HLLButton *button=(HLLButton*)sender;
    
    // remove clicked button information
    [filterArray removeObjectIdenticalTo:button.information];
    
    // select button
    [button setSelected:!button.selected];
    
    // add clicked button information if selected
    if (button.selected)
    {
        [filterArray addObject:button.information];
    }
}

- (IBAction)searchButtonPressed:(id)sender
{
    // delegate
    if([self.delegate respondsToSelector:@selector(productFilterViewController:filter:keyword:)])
    {
        [self.delegate productFilterViewController:self filter:self.filterArray keyword:searchText];
    }
    
    // close right controller
    [self.viewDeckController closeRightViewAnimated:YES];
}

- (IBAction)clearButtonPressed:(id)sender
{
    // clear search text
    self.searchTextField.text=@"";
    
    // clear all filter button
    for (HLLButton *button in filterButtonArray)
    {
        [button setSelected:NO];
    }
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

@end
