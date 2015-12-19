//
//  DemoTwoViewController.m
//  iOSMoveViewWhenKeyboardAppearsDemo
//
//  Created by Chen-An Huang on 12/19/15.
//  Copyright © 2015 Yolk Huang. All rights reserved.
//

#import "DemoTwoViewController.h"

@interface DemoTwoViewController ()

@property (nonatomic) CGFloat buttonOriginalTopY;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)buttonOnTap:(id)sender;

@end

@implementation DemoTwoViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Text field on single view";
  self.buttonOriginalTopY = CGRectGetMinY(self.button.frame);
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
  NSDictionary *info = [aNotification userInfo];
  NSTimeInterval keyboardAniimationDuration = [(NSNumber *)info[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
  CGRect keyboardRect = [(NSValue *)info[UIKeyboardFrameEndUserInfoKey] CGRectValue];

  CGRect buttonFrame = self.button.frame;
  
  CGFloat offsetY = CGRectGetHeight(self.view.frame) - CGRectGetHeight(keyboardRect) - CGRectGetHeight(buttonFrame) - 20;
  buttonFrame.origin.y = offsetY;
  
  __weak typeof(self) weakSelf = self;
  [UIView animateWithDuration:keyboardAniimationDuration animations:^{
    weakSelf.button.frame = buttonFrame;
  }];
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
  NSDictionary *info = [aNotification userInfo];
  NSTimeInterval keyboardAniimationDuration = [(NSNumber *)info[UIKeyboardAnimationDurationUserInfoKey] doubleValue];

  CGRect buttonFrame = self.button.frame;
  buttonFrame.origin.y = self.buttonOriginalTopY;
  
  __weak typeof(self) weakSelf = self;
  [UIView animateWithDuration:keyboardAniimationDuration animations:^{
    weakSelf.button.frame = buttonFrame;
  }];
}

#pragma mark - IBAction

- (IBAction)buttonOnTap:(id)sender {
  [self.view endEditing:YES];
}

@end
