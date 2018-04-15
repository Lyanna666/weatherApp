//
//  WeatherModel.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "CurrentModel.h"
#import "ForecastdayModel.h"

@implementation CurrentModel

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        
        NSDictionary *currentWeather = [dictionary valueForKey:@"current"];
        
        self.tempC = [[currentWeather valueForKey:@"temp_c"] integerValue];
        self.humidity = [[currentWeather valueForKey:@"humidity"] integerValue];
        self.precipMm = [[currentWeather objectForKey:@"precip_mm"] doubleValue];
        self.windKph = [[currentWeather objectForKey:@"wind_kph"] doubleValue];
        
        
        NSDictionary *dic = [currentWeather valueForKey:@"condition"];
        self.code = [[dic valueForKey:@"code"] intValue];
        self.icon = [dic valueForKey:@"icon"];
        self.text = [dic valueForKey:@"text"];
        
        dic = [dictionary valueForKey:@"location"];
        self.country = [dic valueForKey:@"country"];
        self.localtime = [dic valueForKey:@"localtime"];
        self.name = [dic valueForKey:@"name"];
        
        dic = [dictionary valueForKey:@"forecast"];
        NSDictionary *forecastDic = [dic valueForKey:@"forecastday"];
        
        NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
        
        for (NSDictionary *detalDic in forecastDic)
        {
            dic = [detalDic valueForKey:@"day"];
            NSDictionary *contition = [dic valueForKey:@"condition"];
            
            ForecastdayModel *forecastModel = [[ForecastdayModel alloc]init:[detalDic valueForKey:@"date"] icon:[contition valueForKey:@"icon"] minT:[[dic valueForKey:@"mintemp_c"] integerValue] maxT:[[dic valueForKey:@"maxtemp_c"]integerValue]];
            
            [mutableArray addObject:forecastModel];
            
        }
        
        self.forecast = mutableArray;
        
    }
    return self;
}

@end
