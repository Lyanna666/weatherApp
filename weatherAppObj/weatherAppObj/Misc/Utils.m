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

+ (UIImage *)imageFromUrl:(NSString *)urlString {
    NSString *imageUrl = [NSString stringWithFormat:@"http://www.apixu.com/static%@", [urlString substringFromIndex:15]];
    UIImage *image = [[UIImage alloc]init];
    
    NSURL *url = [[NSURL alloc] initWithString:imageUrl];
    
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    
    if (data) {
        image = [UIImage imageWithData:data];
    }
    return image;
}

+ (void) showAlertView:(UIViewController *)view  textMessage:(NSString *)textMessage {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Atención"
                                                                   message:textMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [view presentViewController:alert animated:YES completion:nil];
}

+ (NSDate *) transformStringToDate:(NSString *)format dateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = format;
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return date;
}

+ (NSString *) getCurrentDay {
    
    NSDate *date = [[NSDate alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"es_ES"];
    [formatter setLocale:locale];

    formatter.dateFormat = @"EEEE, dd 'de' MMMM yyyy";
    
    NSString *currentDate = [formatter stringFromDate:date];
    
    return [currentDate capitalizedString];
}


+ (NSString *) getDayString:(NSDate *)date{
    NSString *day= @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"es_ES"];
    [formatter setLocale:locale];
    formatter.dateFormat = @"EEEE";
    
    day = [formatter stringFromDate:date];
    
    return [day capitalizedString];
}


@end
