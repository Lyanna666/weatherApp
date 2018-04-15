//
//  DataManager.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlowManager.h"

@interface DataManager : NSObject

@property (strong,nonatomic) FlowManager *flowManager;

- (void)searchByCityName:(NSString *)cityName;

@end
