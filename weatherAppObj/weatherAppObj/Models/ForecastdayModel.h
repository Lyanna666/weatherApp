//
//  ForecastdayModel.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastdayModel : NSObject

- (instancetype)init:(NSString *)date icon:(NSString *)icon minT:(NSInteger)minT maxT:(NSInteger)maxT;

@property NSString *icon;
@property NSString *date;
@property NSInteger maxT;
@property NSInteger minT;

@end
