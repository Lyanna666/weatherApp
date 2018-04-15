//
//  ForecastdayModel.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "ForecastdayModel.h"

@implementation ForecastdayModel

- (instancetype)init:(NSString *)date icon:(NSString *)icon minT:(NSInteger)minT maxT:(NSInteger)maxT
{
    self.date = date;
    self.icon = icon;
    self.minT = minT;
    self.maxT = maxT;
    
    return self;
}
    

@end
