//
//  AppDelegate.m
//  iOSMoveViewWhenKeyboardAppearsDemo
//
//  Created by Chen-An Huang on 12/18/15.
//  Copyright © 2015 Yolk Huang. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  TableViewController *tableViewController = [[TableViewController alloc] init];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
  navigationController.navigationBar.translucent = NO;
  self.window.rootViewController = navigationController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
