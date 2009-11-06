//
//  MyTableViewController.m
//  TableFun
//
//  Created by David Nolen on 3/11/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"

@implementation MyTableViewController


- (void) viewDidLoad 
{
  [super viewDidLoad];

  // must end initWithObject with nil
  theData = [[NSMutableArray alloc] initWithObjects:@"Abe", @"Barbara", @"Cathy", @"Donald", @"Evan", @"Fred", @"Gale", @"Hannah", nil];
  
  [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning 
{
  [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
  // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
  return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
  return [theData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
  static NSString *CellIdentifier = @"Cell";
  
  MyTableViewCell *cell = (MyTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if(cell == nil) 
  {
    cell = [[[MyTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
  }
  
  [cell setData:[theData objectAtIndex:[indexPath row]]];

  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
  // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


- (void)dealloc 
{
  [super dealloc];
}


@end

