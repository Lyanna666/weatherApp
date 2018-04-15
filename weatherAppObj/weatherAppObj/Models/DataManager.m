//
//  DataManager.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "DataManager.h"
#import "AFNetworking.h"
#import "CurrentModel.h"

@implementation DataManager

static NSString * const BaseURLString = @"https://api.apixu.com/v1/forecast.json";
static NSString * const Apikey = @"d3fd5aebb09a499aa77165755180704";

- (void)searchByCityName:(NSString *)cityName
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?key=%@&q=%@", BaseURLString,Apikey,cityName]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
//            NSLog(@"%@ %@", response, responseObject);
            
            CurrentModel *currentModel = [[CurrentModel alloc] initWithDictionary:responseObject];
            
            [self.flowManager getWeatherRequestEnded:currentModel];
            
            
            
        }
    }];
    [dataTask resume];
}


@end
