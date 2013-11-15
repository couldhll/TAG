//
//  CSCreateNewCSViewController.m
//  TAG
//
//  Created by 陈顺 on 13-11-7.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "CSCreateNewCSViewController.h"

@interface CSCreateNewCSViewController ()
    
@end

@implementation CSCreateNewCSViewController


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
    
    UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    t.font = [UIFont systemFontOfSize:25];
    t.textColor = RGBA(25, 77, 157, 1);
    t.backgroundColor = [UIColor clearColor];
    t.textAlignment = UITextAlignmentCenter;
    t.text = @"CREATE NEW CS";
    self.navigationItem.titleView = t;
    
    //leftButton
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Menu/Favorites/favorites_left@2x.png"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Resource/Menu/Favorites/favorites_left@2x.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchDown];
    [leftButton setFrame: CGRectMake(0, 0, 32, 29)];
    //[leftButton setBackgroundImage:stretch forState:UIControlStateNormal];
    //[leftButton sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    CGSize size;
    size.width = self.view.frame.size.width;
    size.height = self.view.frame.size.height*2;
    
    self._scrollViewHow.contentSize = size;
    
    CGRect rect;
    rect.origin.x = 0;
    rect.origin.y = 190;
    rect.size.width = self._scrollViewHow.frame.size.width;
    rect.size.height = self._scrollViewHow.frame.size.height;
    [self._scrollViewHow setFrame:rect];
    
    self.btnHow.backgroundColor = RGB(233, 233, 233);
    [self.btnHow setTitleColor:RGB(25, 77, 157) forState:UIControlStateNormal];

    
    CGSize sizeHelp;
    sizeHelp.width = self.view.frame.size.width;
    sizeHelp.height = self.view.frame.size.height*2;
    
    self._scrollViewHelp.contentSize = size;
    
    CGRect rectHelp;
    rectHelp.origin.x = 0;
    rectHelp.origin.y = 190;
    rectHelp.size.width = self._scrollViewHow.frame.size.width;
    rectHelp.size.height = self._scrollViewHow.frame.size.height;
    [self._scrollViewHelp setFrame:rect];
    
    [self.view addSubview:self._scrollViewHow];
    
    

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (IBAction)kickHowBtn:(id)sender
{

    [self._scrollViewHelp removeFromSuperview];
    [self._viewCatalog removeFromSuperview];
    
    self.btnHow.backgroundColor = RGB(233, 233, 233);
    [self.btnHow setTitleColor:RGB(25, 77, 157) forState:UIControlStateNormal];
    
    
    [self.btnCatalog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnFAQ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnHelp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.btnCatalog.backgroundColor = RGB(25, 77, 157);
    self.btnFAQ.backgroundColor = RGB(25, 77, 157);
    self.btnHelp.backgroundColor = RGB(25, 77, 157);

    
    
    CGSize size;
    size.width = self.view.frame.size.width;
    size.height = self.view.frame.size.height*2+300;
    
    self._scrollViewHow.contentSize = size;
    
    CGRect rect;
    rect.origin.x = 0;
    rect.origin.y = self.btnHow.frame.size.height;
    rect.size.width = self._scrollViewHow.frame.size.width;
    rect.size.height = self._scrollViewHow.frame.size.height;
    [self._scrollViewHow setFrame:rect];
    [self.view addSubview:self._scrollViewHow];

    
}
- (IBAction)kickCatalogBtn:(id)sender
{
    [self._scrollViewHow removeFromSuperview];
    [self._scrollViewHelp removeFromSuperview];
    
    self.btnCatalog.backgroundColor = RGB(233, 233, 233);
    [self.btnCatalog setTitleColor:RGB(25, 77, 157) forState:UIControlStateNormal];
    
    [self.btnHow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnHelp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnFAQ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btnHow.backgroundColor = RGB(25, 77, 157);
    self.btnHelp.backgroundColor = RGB(25, 77, 157);
    self.btnFAQ.backgroundColor = RGB(25, 77, 157);
    self.btnCatalog.backgroundColor = RGB(233, 233, 233);

    
    
    CGRect rect;
    rect.origin.x = 0;
    rect.origin.y = self.btnHow.frame.size.height;
    rect.size.width = self._scrollViewHow.frame.size.width;
    rect.size.height = self._scrollViewHow.frame.size.height;
    [self._viewCatalog setFrame:rect];
    [self.view addSubview:self._viewCatalog];

    
}


- (IBAction)kickHelpBtn:(id)sender
{
    
    [self._scrollViewHow removeFromSuperview];
    [self._viewCatalog removeFromSuperview];
    
    self.btnHelp.backgroundColor = RGB(233, 233, 233);
    [self.btnHelp setTitleColor:RGB(25, 77, 157) forState:UIControlStateNormal];
    
    [self.btnHow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnCatalog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnFAQ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btnHow.backgroundColor = RGB(25, 77, 157);
    self.btnCatalog.backgroundColor = RGB(25, 77, 157);
    self.btnFAQ.backgroundColor = RGB(25, 77, 157);
    self.btnHelp.backgroundColor = RGB(233, 233, 233);
    
    
    self._scrollViewHelp.scrollsToTop = YES;
    
    CGSize size;
    size.width = self.view.frame.size.width;
    size.height = 2100;
    
    self._scrollViewHelp.contentSize = size;
    
    CGRect rect;
    rect.origin.x = 0;
    rect.origin.y = self.btnHow.frame.size.height;
    rect.size.width = self._scrollViewHow.frame.size.width;
    rect.size.height = self._scrollViewHow.frame.size.height;
    [self._scrollViewHelp setFrame:rect];
    [self.view addSubview:self._scrollViewHelp];
}

- (IBAction)kickFAQBtn:(id)sender
{
    
}








@end
