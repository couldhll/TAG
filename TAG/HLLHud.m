//
//  HLLHud.m
//  TAG
//
//  Created by CouldHll on 13-10-24.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLHud.h"

#import <MBProgressHUD/MBProgressHUD.h>

@implementation HLLHud

+ (void)loading:(NSString*)title detail:(NSString*)detail
{
    [HLLHud loading:[AppDelegate window] title:title detail:detail];
}

+ (void)loading:(UIView*)view title:(NSString*)title detail:(NSString*)detail
{
    // hud loading
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = title;
    hud.detailsLabelText = detail;
}

+ (void)success:(NSString*)title detail:(NSString*)detail
{
    [HLLHud success:[AppDelegate window] title:title detail:detail];
}

+ (void)success:(UIView*)view title:(NSString*)title detail:(NSString*)detail
{
    // hud success
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Resource/Frame/HUD/hud_success.png"]];
    hud.labelText = title;
    hud.detailsLabelText = detail;
    int64_t         delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                  {
                      // hide hud
                      [HLLHud hideHud:view];
                  });
}

+ (void)error:(NSString*)title detail:(NSString*)detail
{
    [HLLHud error:[AppDelegate window] title:title detail:detail];
}

+ (void)error:(UIView*)view title:(NSString*)title detail:(NSString*)detail
{
    // hud error
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Resource/Frame/HUD/hud_error.png"]];
    hud.labelText = title;
    hud.detailsLabelText = detail;
    int64_t         delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                   {
                       // hide hud
                       [HLLHud hideHud:view];
                   });
}

+ (void)hideHud
{
    [HLLHud hideHud:[AppDelegate window]];
}

+ (void)hideHud:(UIView*)view
{
    // hide hud
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
