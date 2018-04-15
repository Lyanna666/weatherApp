//
//  FlowManager.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "FlowManager.h"
#import "DataManager.h"
#import "Utils.h"

@interface FlowManager ()

@property (strong, nonatomic) DataManager* dataMnager;
@property (strong, nonatomic) CurrentModel* currentModel;

@end

@implementation FlowManager

- (instancetype)init {
    
    self.dataMnager = [[DataManager alloc]init];
    
    return self;
}


- (void)getCurrentWeather:(NSString *)cityName {
    
    self.dataMnager.flowManager = self;
    [self.dataMnager searchByCityName:cityName];
}

- (void)getWeatherRequestEnded:(CurrentModel *)currentModel {
    self.currentModel = currentModel;
    
    switch (self.currentView) {
        case ByName:
            [self.viewControllerByName printData:self.currentModel];
            
            break;
        case ByCoordinates:
            break;
        default:
            break;
    }
    
}

- (void)getWeatherRequestFailed {
    
    switch (self.currentView) {
        case ByName:
            
            [Utils dismissLoadingView:self.viewControllerByName.view];
            [Utils showAlertView:self.viewControllerByName textMessage:@"Lo sentimos, ha ocurrido un error."];
            break;
        case ByCoordinates:
            [Utils dismissLoadingView:self.viewControllerByName.view];
            [Utils showAlertView:self.viewControllerByName textMessage:@"Lo sentimos, ha ocurrido un error."];
            break;
        default:
            break;
    }
}

@end
