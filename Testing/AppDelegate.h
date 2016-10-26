//
//  AppDelegate.h
//  Testing
//
//  Created by Patricia Springer on 10/26/16.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

