//
//  FlowManager.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentModel.h"
#import <UIKit/UIKit.h>
#import "WeatherByNameViewController.h"


@interface FlowManager : NSObject

typedef enum {
    ByName,
    ByCoordinates
} CurrentView;


- (void)getWeatherRequestFailed;
- (void)getCurrentWeather:(NSString *)cityName;
- (void)getWeatherRequestEnded:(CurrentModel *)currentModel;

@property (assign,nonatomic) CurrentView currentView;

@property (strong,nonatomic) WeatherByNameViewController *viewControllerByName;

@end
