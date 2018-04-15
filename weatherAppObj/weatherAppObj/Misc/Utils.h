//
//  Utils.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

+ (void)startLoadingInView:(UIView *)view;
+ (void)dismissLoadingView:(UIView *)view;
+ (UIImage *)imageFromUrl:(NSString *)urlString;
+ (void) showAlertView:(UIViewController *)view  textMessage:(NSString *)textMessage;
+ (NSDate *) transformStringToDate:(NSString *)format dateString:(NSString *)dateString;
+ (NSString *) getDayString:(NSDate *)date;
+ (NSString *) getCurrentDay;

@end

