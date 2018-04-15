//
//  SearhByCoordinatesViewController.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentModel.h"
#import <MapKit/MapKit.h>

@interface SearhByCoordinatesViewController : UIViewController 

- (void)printData:(CurrentModel *)currentModel;

@property (strong, nonatomic) CurrentModel *currentModel;

@end
