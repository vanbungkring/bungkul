//
//  boorpaAppDelegate.m
//  Boorpa
//
//  Created by Arie on 4/22/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaAppDelegate.h"

@implementation boorpaAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200.f, 0) forBarMetrics:UIBarMetricsDefault];
	
	[[UINavigationBar appearance] setTintColor:[UIColor lightGrayColor]];
	
	NSShadow *shadow = [[NSShadow alloc] init];
    
	shadow.shadowColor = [UIColor clearColor];
    
	shadow.shadowOffset = CGSizeMake(0, 1);
    
	[[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor darkGrayColor], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:fontDefault size:18], NSFontAttributeName, nil]];
    // Override point for customization after application launch.
    last_string =@"";
    [self showIntro];
    [self.window makeKeyAndVisible];
     [[Ubertesters shared] initialize];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
-(void)showIntro{
	// Init the pages texts, and pictures.
	NSArray *tutorialLayers = nil;
	if ([[UIScreen mainScreen] bounds].size.height == 568) {
		ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"1-568h"];
		ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"2-568h"];
		ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"3-568h"];
		ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"4-568h"];
		
		tutorialLayers  = @[layer1,layer2,layer3,layer4];
		
		//this is iphone 5 xib
    } else {
		ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"1"];
		ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"2"];
		ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"3"];
		ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithSubTitle:@""
																description:@""
																pictureName:@"4"];
		
		tutorialLayers  = @[layer1,layer2,layer3,layer4];
		
    }
    
    // Set the common style for SubTitles and Description (can be overrided on each page).
    ICETutorialLabelStyle *subStyle = [[ICETutorialLabelStyle alloc] init];
    [subStyle setFont:TUTORIAL_SUB_TITLE_FONT];
    [subStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [subStyle setLinesNumber:TUTORIAL_SUB_TITLE_LINES_NUMBER];
    [subStyle setOffset:TUTORIAL_SUB_TITLE_OFFSET];
	
    
    ICETutorialLabelStyle *descStyle = [[ICETutorialLabelStyle alloc] init];
    [descStyle setFont:TUTORIAL_DESC_FONT];
    [descStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [descStyle setLinesNumber:TUTORIAL_DESC_LINES_NUMBER];
    [descStyle setOffset:TUTORIAL_DESC_OFFSET];
    
    // Load into an array.
    
    // Override point for customization after application launch.
	if ([[UIScreen mainScreen] bounds].size.height == 568) {
		self.viewController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPhone4"
                                                                      bundle:nil
                                                                    andPages:tutorialLayers];
		
    } else {
		self.viewController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPhone"
                                                                      bundle:nil
                                                                    andPages:tutorialLayers];
    }
    
    // Set the common styles, and start scrolling (auto scroll, and looping enabled by default)
    [self.viewController setCommonPageSubTitleStyle:subStyle];
    [self.viewController setCommonPageDescriptionStyle:descStyle];
	
	
	__unsafe_unretained typeof(self) weakSelf = self;
    // Set button 1 action.
    [self.viewController setButton1Block:^(UIButton *button){
        [weakSelf call:@"boorpaRegisterViewController"];
    }];
    
    // Set button 2 action, stop the scrolling.
	
    [self.viewController setButton2Block:^(UIButton *button){
        [weakSelf checkToken];
       // [weakSelf call:@"boorpaLoginViewController"];
    }];
    
    // Run it.
    [self.viewController startScrolling];
    _drawerController = [[MMDrawerController alloc] init];
    [_drawerController setRestorationIdentifier:@"netra"];
    [_drawerController setMaximumRightDrawerWidth:270];
	[_drawerController setMaximumLeftDrawerWidth:270];
    [_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
	[_drawerController setShouldStretchDrawer:FALSE];
	[_drawerController setDrawerVisualStateBlock:[MMDrawerVisualState slideVisualStateBlock]];
	[_drawerController setShowsShadow:NO];
	self.window.rootViewController=self.viewController;
	
}
-(void)setLeftOff{
	[_drawerController setRightDrawerViewController:Nil];
    [_drawerController setLeftDrawerViewController:Nil];
    [_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
}
-(void)setLeftOn{
	[_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_drawerController setLeftDrawerViewController:[[NSClassFromString(@"boorpaRightViewController") alloc]init]];
}
- (void)checkToken{
    
    [self.window.rootViewController dismissViewControllerAnimated:YES completion:Nil];
    self.window.rootViewController = nil;
    [self loadpage];
//	NSLog(@"data-->%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]);
//	if([[NSUserDefaults standardUserDefaults] objectForKey:@"token"]==Nil){
//		[self.window.rootViewController dismissViewControllerAnimated:YES completion:Nil];
//		[self showIntro];
//	}
//	
//	else{
//		//[self showIntro];
//		[self.window.rootViewController dismissViewControllerAnimated:YES completion:Nil];
//		[self loadpage];
//	}
	
}
-(void)setCenter:(NSString*)center{
	NSLog(@"center->%@",center);
	if ([center isEqualToString:last_string]) {
		[_drawerController closeDrawerAnimated:YES completion:Nil];
	}
    else{
        last_string=center;
        [_drawerController closeDrawerAnimated:YES completion:Nil];
        UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonItemStyleDone
                                           target:self action:@selector(refreshClicked:)];
        
        UINavigationController *navigationController1 =[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(center) alloc]init]];
        navigationController1.navigationItem.rightBarButtonItem = refreshButton;
        [_drawerController setCenterViewController:navigationController1];
    }
}
-(void)loadpage{

	UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"boorpaRestoListViewController") alloc]init]];

    [_drawerController setCenterViewController:navigationController1];
    [_drawerController setLeftDrawerViewController:[[NSClassFromString(@"boorpaRightViewController") alloc]init]];
    self.window.rootViewController =_drawerController;
	
}
-(void)call:(NSString*)status{
	
	UINavigationController *navO= [[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(status) alloc]init]];
	navO.modalTransitionStyle = UIModalPresentationFormSheet;
	[navO.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	
	[self.window.rootViewController presentViewController:navO animated:YES completion:nil];
	
	
}
- (void)signIntoServer:(NSDictionary *)params{
    [self checkToken];
}
- (void)signUptoServer:(NSDictionary *)params{
    [self checkToken];
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Boorpa" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Boorpa.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSString * key = [identifierComponents lastObject];
    if([key isEqualToString:@"netra"]){
        return self.window.rootViewController;
    }
    else if ([key isEqualToString:@"MMExampleCenterNavigationControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).centerViewController;
    }
    else if ([key isEqualToString:@"MMExampleLeftSideDrawerController"]){
        return ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
    }
    else if ([key isEqualToString:@"MMExampleRightSideDrawerController"]){
        return ((MMDrawerController *)self.window.rootViewController).rightDrawerViewController;
    }
    return nil;
}
@end
