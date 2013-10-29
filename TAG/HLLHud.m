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

+ (void)success:(NSString*)title detail:(NSString*)detail
{
    [HLLHud success:[AppDelegate window] title:title detail:detail];
}

+ (void)error:(NSString*)title detail:(NSString*)detail
{
    [HLLHud error:[AppDelegate window] title:title detail:detail];
}

+ (void)success:(UIView*)view title:(NSString*)title detail:(NSString*)detail
{
    // hud login success
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Resource/Frame/HUD/hud_success.png"]];
    hud.labelText = title;
    hud.detailsLabelText = detail;
    int64_t         delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                  {
                      // close hud
                      [MBProgressHUD hideHUDForView:view animated:YES];
                  });
}

+ (void)error:(UIView*)view title:(NSString*)title detail:(NSString*)detail
{
    // hud login success
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Resource/Frame/HUD/hud_error.png"]];
    hud.labelText = title;
    hud.detailsLabelText = detail;
    int64_t         delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                   {
                       // close hud
                       [MBProgressHUD hideHUDForView:view animated:YES];
                   });
}


@end
