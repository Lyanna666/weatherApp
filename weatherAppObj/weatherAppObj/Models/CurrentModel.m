//
//  WeatherModel.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "CurrentModel.h"

@implementation CurrentModel

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        
        NSDictionary *currentWeather = [dictionary valueForKey:@"current"];
        
        self.temp_c = [[currentWeather objectForKey:@"temp_c"] doubleValue];
    }
    return self;
}

@end
