//
//  AppDelegate.h
//  TP_lab7_1
//
//  Created by Admin on 20.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

