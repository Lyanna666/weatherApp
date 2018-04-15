//
//  AppDelegate.h
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

