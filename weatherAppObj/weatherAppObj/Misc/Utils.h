//
//  Utils.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface Utils : NSObject

+ (void)startLoadingInView:(UIView *)view;
+ (void)dismissLoadingView:(UIView *)view;

@end

