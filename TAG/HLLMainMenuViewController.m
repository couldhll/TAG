//
//  HLLMainMenuViewController.m
//  TAG
//
//  Created by CouldHll on 13-10-5.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//


#import "HLLMainMenuViewController.h"

@interface HLLMainMenuViewController ()
{
    NSMutableDictionary *buttonNotificationDictionary;
    NSMutableDictionary *notificationButtonDictionary;
}

@end

@implementation HLLMainMenuViewController

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
    self.productListButton.name=@"productListButton";
    self.brandButton.name=@"brandButton";
    self.favoriteButton.name=@"favoriteButton";
    self.friendButton.name=@"friendButton";
    self.followButton.name=@"followButton";
    self.userHomeButton.name=@"userHomeButton";
    self.createCSButton.name=@"createCSButton";
    self.settingButton.name=@"settingButton";
    self.loginorloginoutButton.name=@"loginorloginoutButton";
    
    // map with button and notification
    buttonNotificationDictionary=[NSMutableDictionary dictionary];
    [buttonNotificationDictionary setValue:@"HLLProductListViewController" forKey:@"productListButton"];
    [buttonNotificationDictionary setValue:nil forKey:@"brandButton"];
    [buttonNotificationDictionary setValue:@"CSUserFavoritesViewController" forKey:@"favoriteButton"];
    [buttonNotificationDictionary setValue:@"HLLUserFriendViewController" forKey:@"friendButton"];
    [buttonNotificationDictionary setValue:nil forKey:@"followButton"];
    [buttonNotificationDictionary setValue:nil forKey:@"userHomeButton"];
    [buttonNotificationDictionary setValue:@"CSCreateNewCSViewController" forKey:@"createCSButton"];
    [buttonNotificationDictionary setValue:nil forKey:@"settingButton"];
    [buttonNotificationDictionary setValue:@"HLLUserLoginViewController" forKey:@"loginorloginoutButton"];
    
    // map with notification and button
    notificationButtonDictionary=[NSMutableDictionary dictionary];
    for (NSString *key in buttonNotificationDictionary.keyEnumerator)
    {
        [notificationButtonDictionary setValue:key forKey:[buttonNotificationDictionary valueForKey:key]];
    }
    
    // select button notification
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(changeSelectButton:)
                                                 name: NOTIFICATION_OPENVIEWCONTROLLER
                                               object: nil];
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
    
    // logout
    if ([button.name isEqual:@"loginorloginoutButton"])
    {
        HLLLoginButton *loginButton=(HLLLoginButton*)button;
        if (loginButton.logined)
        {
            // logout
            [HLLDataAuthorizeProvider userLogout:self.view
                        completion:nil
                           success:nil
                             error:nil];
            
            return;
        }
    }
    
    NSString *controllerName=[buttonNotificationDictionary valueForKey:button.name];
    [AppDelegate openViewController:controllerName sender:self];
    
    // tracking button press
    [HLLTracker eventWithCategory:HLLTrackCategoryTypeButton action:HLLTrackActionTypeButtonPress object:[NSString stringWithFormat:@"%@/%@",self.trackingName,button.name] value:HLLTrackValueTypeNone];
}

#pragma mark - Select button

- (void)changeSelectButton:(NSNotification *)notification
{
    // get select button name
	NSString *controllerName=[notification.userInfo valueForKey:@"name"];
    NSString *buttonName=[notificationButtonDictionary valueForKey:controllerName];
    
    // set select button
    [self selectButton:buttonName];
}

- (void)selectButton:(NSString *)buttonName
{
    if (!buttonName)
    {
        return;
    }
    
    if ([buttonName isEqual:@"loginorloginoutButton"])
    {
        
    }
    else
    {
        // unselect all button
        for (NSString *name in buttonNotificationDictionary.keyEnumerator)
        {
            UIButton *button=[self valueForKey:name];
            [button setSelected:NO];
        }
        
        // select button
        UIButton *button=[self valueForKey:buttonName];
        [button setSelected:YES];
    }
}

@end
