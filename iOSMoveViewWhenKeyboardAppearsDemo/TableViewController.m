//
//  TableViewController.m
//  iOSMoveViewWhenKeyboardAppearsDemo
//
//  Created by Chen-An Huang on 12/18/15.
//  Copyright © 2015 Yolk Huang. All rights reserved.
//

#import "TableViewController.h"
#import "DemoOneViewController.h"
#import "DemoTwoViewController.h"

@interface TableViewController ()

@property (nonatomic) NSArray *demos;

@end

static NSString * const TableViewControllerCellReuseIdentifier = @"CellReuseIdentifier";

@implementation TableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Demo";
  self.demos = @[
                 @"Fetch keyboard notification user info",
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
  NSUInteger row = indexPath.row;
  if (row == 0) {
    DemoOneViewController *demoOneViewController = [[DemoOneViewController alloc] initWithNibName:@"DemoOneViewController" bundle:nil];
    [self.navigationController pushViewController:demoOneViewController animated:YES];
  } else if (row == 1) {
    DemoTwoViewController *demoTwoViewController = [[DemoTwoViewController alloc] initWithNibName:@"DemoTwoViewController" bundle:nil];
    [self.navigationController pushViewController:demoTwoViewController animated:YES];
  }
  

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
