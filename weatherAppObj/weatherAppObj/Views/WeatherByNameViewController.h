//
//  WeatherByNameViewController.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentModel.h"

@interface WeatherByNameViewController : UIViewController

- (void)printData:(CurrentModel *)currentModel;

@end
