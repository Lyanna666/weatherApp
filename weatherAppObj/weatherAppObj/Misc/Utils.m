//
//  Utils.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "Utils.h"
#import "MBProgressHUD.h"

@interface Utils ()

@end

@implementation Utils

+ (void)startLoadingInView:(UIView *)view {
    MBProgressHUD *loadingHub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    loadingHub.bezelView.backgroundColor = [UIColor clearColor];
    loadingHub.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    loadingHub.backgroundView.layer.cornerRadius = loadingHub.backgroundView.frame.size.height/4;
    loadingHub.label.text = @"Cargando...";
    loadingHub.label.font =  [UIFont fontWithName:@"Decima Nova Pro" size:17];
}

+ (void)dismissLoadingView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
