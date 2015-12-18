//
//  TableViewController.m
//  iOSMoveViewWhenKeyboardAppearsDemo
//
//  Created by Chen-An Huang on 12/18/15.
//  Copyright © 2015 Yolk Huang. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic) NSArray *demos;

@end

static NSString * const TableViewControllerCellReuseIdentifier = @"CellReuseIdentifier";

@implementation TableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Demo";
  self.demos = @[
                 @"Text field on single view",
                 @"Text field on scroll view",
                 @"Text field on table view cell",
                 @"Text view on single view",
                 @"Text view on scroll view",
                 @"Text view on table view cell"
                 ];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewControllerCellReuseIdentifier];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.demos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewControllerCellReuseIdentifier forIndexPath:indexPath];
  
  NSUInteger row = indexPath.row;
  NSString *title = [NSString stringWithFormat:@"%d. %@", (short)row + 1, self.demos[row]] ;
  cell.textLabel.text = title;
  return cell;
}

@end
