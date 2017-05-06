//
//  AppDelegate.h
//  TP_lab5_3_Pogoda
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

