//
//  WeatherModel.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CurrentModel:NSObject

@property double humidity;
@property NSInteger tempC;
@property double precipMm;
@property double windKph;

@property NSString *country;
@property NSString *localtime;
@property NSString *lon;
@property NSString *lat;
@property NSString *name;

@property int code;
@property NSString *icon;
@property NSString *text;

@property NSArray *forecast;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end



