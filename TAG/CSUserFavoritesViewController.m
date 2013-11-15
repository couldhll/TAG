//
//  CSUserFavoritesViewController.m
//  TAG
//
//  Created by 陈顺 on 13-10-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "CSUserFavoritesViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "HLLMacroDefinition.h"

@interface CSUserFavoritesViewController ()
{
    //NSMutableArray* dateSource_;
}
@end

@implementation CSUserFavoritesViewController

@synthesize dataArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.navigationItem.titleView = [[UIFont fontWithName:@"FAVORITES" size:<#(CGFloat)#>] in];
    //self.navigationItem.title = @"FAVORITES";
    
    UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    t.font = [UIFont systemFontOfSize:25];
    t.textColor = RGBA(25, 77, 157, 1);
    t.backgroundColor = [UIColor clearColor];
    t.textAlignment = UITextAlignmentCenter;
    t.text = @"FAVORITES";
    self.navigationItem.titleView = t;
    
    //leftButton
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Menu/Favorites/favorites_left@2x.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Menu/Favorites/favorites_left@2x.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchDown];
    [leftButton setFrame: CGRectMake(0, 0, 32, 29)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    

    //RightButton
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Menu/Favorites/favorites_right@2x.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Resource/Menu/Favorites/favorites_right@2x.png"] forState:UIControlStateHighlighted];
    //[rightButton setba]
    //[rightButton addTarget:self.viewDeckController action:@selector(toggleRightView) forControlEvents:UIControlEventTouchDown];
    [rightButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchDown];
    [rightButton setFrame: CGRectMake(0, 0, 36, 36)];
    //[rightButton sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    //tableView
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
                                      
                                      
    self.tableView.hidden = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    dataArray = [[NSMutableArray alloc] initWithObjects:@"WishList", nil];
    [self.tableView setDataSource:self];

    self.tableViewCell.hidden = YES;
    
    //viewMask
    self.viewMask.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)buttonAllPressed:(id)sender
{
    //req sever all info
    
    self.tableView. hidden = YES;
    self.tableViewCell.hidden = YES;
    self.viewMask.hidden = YES;
    [self.textInputCollection resignFirstResponder];
    
    
}

- (IBAction)buttonCollectionPressed:(id)sender
{
    if (self.tableView.hidden) {
        self.tableView.hidden = NO;
        self.tableViewCell.hidden = NO;
        self.viewMask.hidden = NO;
    }
    else
    {
        self.tableView.hidden = YES;
        self.tableViewCell.hidden = YES;
        self.viewMask.hidden = YES;
    }
    
    
    //req sever collection info
}

- (IBAction)butoonAddCollectPressed:(id)sender
{
    if ([dataArray count] >= 3) {
        NSString* message = @"collection is full";
        UIAlertView* alert = [[UIAlertView alloc] init];
        alert.message = message;
        [alert addButtonWithTitle:@"ok"];
        [alert show];
        return;
    }
    
    
    NSMutableArray* indexPaths = [[NSMutableArray alloc] init];
    NSString* s = self.textInputCollection.text;
    
    if ([s isEqual: @"Name it..."] || [s isEqualToString:@""])
    {
        NSString* message = @"name is empty";
        UIAlertView* alert = [[UIAlertView alloc] init];
        alert.message = message;
        [alert addButtonWithTitle:@"ok"];
        [alert show];
        return;
    }
    
    
    
    [dataArray addObject:s];
    
    
    
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:(dataArray.count-1) inSection:0];
    [indexPaths addObject:indexPath];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView endUpdates];
    
    //clear textField
    self.textInputCollection.text =@"";
}


#pragma mark - TableView


- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}



//初始化ViewTableCell
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"basis-cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    

    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    UILabel *label = [ [ UILabel alloc ] initWithFrame: CGRectMake(10.0, 0.0, 235.0, 35.0) ];
    label.text = [dataArray objectAtIndex:indexPath.row];
    label.textAlignment = UITextAlignmentLeft;
    label.textColor = RGBA(25,77,157,1);
    label.font = [UIFont systemFontOfSize:28.0f];
    label.backgroundColor = [ UIColor whiteColor ];
    [ cell addSubview: label ];
        
    cell.backgroundColor = RGBA(25,77,157,1);

    if (indexPath.row != 0)
    {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeInfoDark];
        UIImage* delectImage = [UIImage imageNamed:@"Resource/Menu/Favorites/collection_delect@2x.png"];
        [button addTarget:self action:@selector(btnClicked:delbutton:)  forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:delectImage forState:UIControlStateNormal];
        cell.accessoryView = button;
            
    }
    
    return cell;
}

//点击删除collectionbutton
- (void)btnClicked:(id)sender delbutton:(id)event
{
    NSSet *touches =[event allTouches];
    UITouch *touch =[touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath= [self.tableView indexPathForRowAtPoint:currentTouchPosition];
    if (indexPath != nil)
    {
        [self tableView: self.tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
    }
}

-(void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath
{
    //这里传数组
    NSUInteger row = [indexPath row];
    
    //NSMutableArray* del = [[NSMutableArray alloc] init];
    //[del addObject: ]'
    
    [dataArray removeObjectAtIndex:row];
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
    //we need to also delete the item from the mutable array
    //[dateSource removeObjectAtIndex:x]
    //may the celldata is cached?

}



//选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    //cell.textLabel.backgroundColor = [UIColor yellowColor];
    
    
    //cell.selectedBackgroundView.backgroundColor = [UIColor yellowColor];
    //cell.selectedBackgroundView.frame = cell.textLabel.frame;

    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor yellowColor];
    cell.selectedBackgroundView = bgView;
    
    
//    /[cell setFrame:CGRectMake(10.0, 10.0, 235.0, 35.0)];
    
   
    
    
    //cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    //cell.selectedBackgroundView.backgroundColor = [UIColor yellowColor];
    
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.textLabel.backgroundColor = [UIColor yellowColor];
    
//    UILabel *label = [ [ UILabel alloc ] initWithFrame: CGRectMake(10.0, 0.0, 235.0, 40.0) ];
//    label.text = [dateSource_ objectAtIndex:indexPath.row];
//    label.textAlignment = UITextAlignmentLeft;
//    label.textColor = RGBA(25,77,157,1);
//    label.font = [UIFont systemFontOfSize:28.0f];
//    //label.shadowColor = [ UIColor grayColor ];
//    //label.shadowOffset = CGSizeMake(0, -1);
//    //label.highlightedTextColor = [ UIColor blackColor ];
//    label.backgroundColor = [ UIColor yellowColor ];
//    [ cell addSubview: label ];

    
    
    //修改背景图片
    //[cell setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Resource/Menu/Favorites/collectkick_background@2x.png"]]];
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //[cell setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Resource/Menu/Favorites/collectkick_background@2x.png"]]];
    
    
    
    //cell.textLabel.opaque = NO;
    //UIImage* image = [UIImage imageNamed:@"Resource/Menu/Favorites/collectkick_background@2x.png"];
    //UIImageView* imageView = [[UIImageView alloc] initWithImage:image];

    //cell.selectedBackgroundView = imageView;
    
    //[self.view sendSubviewToBack:cell];
    
    //cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    
    //cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Resource/Menu/Favorites/collectkick_background@2x.png"]];
    //[self.tableView bringSubviewToFront:cell.textLabel];
    //cell.textLabel.highlighted = [UIColor yellowColor];
    //[tableView sendSubviewToBack:cell.selectedBackgroundView];
    //[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
                                   
    //[self.tableView clearsSelectionOnViewWillAppear];

}

#pragma mark - TextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textInputCollection resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textInputCollection resignFirstResponder];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.textInputCollection selectAll:self];
}


#pragma mark - Share

- (void)share
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    
    // share content
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

- (void)dealloc
{
	self.dataArray = nil;
}


@end
