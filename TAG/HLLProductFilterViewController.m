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
    NSMutableArray *filterArray;
    NSMutableArray *filterButtonArray;
}

@end

@implementation HLLProductFilterViewController

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
    self.csButton.information=@"csButton";
    self.toButton.information=@"toButton";
    self.womenButton.information=@"womenButton";
    self.menButton.information=@"menButton";
    self.kidButton.information=@"kidButton";
    self.geekButton.information=@"geekButton";
    self.cheapButton.information=@"cheapButton";
    self.expensiveButton.information=@"expensiveButton";
    self.saleButton.information=@"saleButton";
    self.comicButton.information=@"comicButton";
    self.toonButton.information=@"toonButton";
    self.freeButton.information=@"freeButton";
    
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
    
    // add search button icon
    UIImage *searchButtonImage=[UIImage imageNamed:@"Resource/Product/List/Filter/arrow_blue_icon.png"];
    UIImageView *searchButtonImageView=[[UIImageView alloc] initWithImage:searchButtonImage];
    searchButtonImageView.frame=CGRectMake(10, (self.searchButton.frame.size.height-searchButtonImageView.frame.size.height)/2, searchButtonImageView.frame.size.width, searchButtonImageView.frame.size.height);
    [self.searchButton addSubview:searchButtonImageView];
    
    // add clear button icon
    UIImage *clearButtonImage=[UIImage imageNamed:@"Resource/Product/List/Filter/arrow_white_icon.png"];
    UIImageView *clearButtonImageView=[[UIImageView alloc] initWithImage:clearButtonImage];
    clearButtonImageView.frame=CGRectMake(10, (self.clearButton.frame.size.height-clearButtonImageView.frame.size.height)/2, clearButtonImageView.frame.size.width, clearButtonImageView.frame.size.height);
    [self.clearButton addSubview:clearButtonImageView];
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
