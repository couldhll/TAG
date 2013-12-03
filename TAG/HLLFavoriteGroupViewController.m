//
//  HLLFavoriteGroupViewController.m
//  TAG
//
//  Created by CouldHll on 13-12-3.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLFavoriteGroupViewController.h"

#import "HLLSelectCell.h"

#define kCellHeight 30

@interface HLLFavoriteGroupViewController ()
{
    NSArray<HLLCollectGroupModel> *groupModels;
}

@end

@implementation HLLFavoriteGroupViewController

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
    
    [HLLDataAuthorizeProvider collectGetGroupList:nil
                                       completion:nil
                                          success:^(id json, JSONModelError *err) {
                                              HLLCollectGroupListModel* collectGroupListModel = [[HLLCollectGroupListModel alloc] initWithDictionary:json error:nil];
                                              if (collectGroupListModel)
                                              {
                                                  groupModels=collectGroupListModel.groups;
                                                  
                                                  // update collect group list
                                                  [self.groupTableView reloadData];
                                              }
                                          }
                                            error:nil];
    
    self.groupTableView.dataSource=self;
    self.groupTableView.delegate=self;
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

#pragma mark - Private Methods

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [groupModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"HLLSelectCellIdentifier";
    
    // register cell
    static BOOL IsRegNib = NO;
    if (!IsRegNib)
    {
        [tableView registerNib:[UINib nibWithNibName:@"HLLSelectCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        IsRegNib = YES;
    }
    
    // get exist cell
    HLLSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // if no cell create one
    if (!cell)
    {
        cell = [[HLLSelectCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
    }
    
    // load data
    HLLCollectGroupModel *collectModel=[groupModels objectAtIndex:[indexPath row]];
    cell.title=collectModel.name;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // get link button
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    HLLLinkButton *linkButton=(HLLLinkButton *)[cell.contentView viewWithTag:kLinkButtonTag];
//
//    // open link
//    [linkButton openLink];
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
