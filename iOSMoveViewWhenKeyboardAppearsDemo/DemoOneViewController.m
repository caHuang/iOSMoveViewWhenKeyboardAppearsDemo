//
//  DemoOneViewController.m
//  iOSMoveViewWhenKeyboardAppearsDemo
//
//  Created by Chen-An Huang on 12/19/15.
//  Copyright © 2015 Yolk Huang. All rights reserved.
//

#import "DemoOneViewController.h"

@interface DemoOneViewController ()

- (void)registerForKeyboardNotifications;
- (void)deregisterForKeyboardNotifications;
- (void)keyboardWasShown:(NSNotification *)aNotification;
- (void)keyboardWillBeHidden:(NSNotification *)aNotification;

@end

@implementation DemoOneViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Keyboard Info";
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self deregisterForKeyboardNotifications];
}


#pragma mark - Private

- (void)registerForKeyboardNotifications {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWasShown:)
                                               name:UIKeyboardDidShowNotification
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillBeHidden:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

- (void)deregisterForKeyboardNotifications {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)keyboardWasShown:(NSNotification *)aNotification {
  NSDictionary* info = [aNotification userInfo];
  NSLog(@"Keyboard Notification User Info: %@", info);
  //  ==================================================================
  //  Keyboard Notification User Info: {
  //  UIKeyboardAnimationCurveUserInfoKey = 7;
  //  UIKeyboardAnimationDurationUserInfoKey = "0.25";
  //  UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 258}}";
  //  UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 796}";
  //  UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 538}";
  //  UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 667}, {375, 258}}";
  //  UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 409}, {375, 258}}";
  //  }
  //  ==================================================================
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
}

@end
