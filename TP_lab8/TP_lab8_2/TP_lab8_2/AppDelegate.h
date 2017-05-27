//
//  AppDelegate.h
//  TP_lab8_2
//
//  Created by Admin on 26.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

