//
//  boorpaAppDelegate.h
//  Boorpa
//
//  Created by Arie on 4/22/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "MMDrawerVisualState.h"
@interface boorpaAppDelegate : UIResponder <UIApplicationDelegate>
{
    MMDrawerController * _drawerController;
    NSString *last_string;
}
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) ICETutorialController *viewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void)checkToken;
- (void)logout;
- (void)signUptoServer:(NSDictionary *)params;
- (void)signIntoServer:(NSDictionary *)params;
- (void)setCenter:(NSString *)center;
- (void)setLeftOff;
- (void)setLeftOn;
@end
