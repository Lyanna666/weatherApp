//
//  WeatherModel.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ConditionModel:NSObject

@property int code;
@property NSString *icon;
@property NSString *text;

@end

@interface Location:NSObject

@property NSString *country;
@property NSString *localtime;
@property NSString *lon;
@property NSString *lat;
@property NSString *name;

@end

@interface CurrentModel:NSObject

@property double humidity;
@property double temp_c;
@property double precip_mm;
@property double wind_kph;
@property ConditionModel *condition;
@property Location *location;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end



