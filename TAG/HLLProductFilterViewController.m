//
//  HLLProductFilterViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-10.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLProductFilterViewController.h"

@interface HLLProductFilterViewController ()

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
    
    // init button name
    self.csButton.name=@"csButton";
    self.toButton.name=@"toButton";
    self.womenButton.name=@"womenButton";
    self.menButton.name=@"menButton";
    self.kidButton.name=@"kidButton";
    self.geekButton.name=@"geekButton";
    self.cheapButton.name=@"cheapButton";
    self.expensiveButton.name=@"expensiveButton";
    self.saleButton.name=@"saleButton";
    self.comicButton.name=@"comicButton";
    self.toonButton.name=@"toonButton";
    self.freeButton.name=@"freeButton";
//    self.searchButton.name=@"searchButton";
//    self.clearButton.name=@"clearButton";
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

- (IBAction)buttonPressed:(id)sender
{
    HLLButton *button=(HLLButton*)sender;
    [button setSelected:!button.selected];
}

@end
