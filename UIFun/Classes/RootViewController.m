//
//  RootViewController.m
//  UIFun
//
//  Created by David Nolen on 4/6/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@implementation RootViewController

- (id) initWithCoder:(NSCoder*)coder
{
  self = [super initWithCoder:coder];
  if(self != nil)
  {
    self.title = @"First View";
  }
  return self;
}

- (void)viewDidLoad 
{
  [super viewDidLoad];
}

- (IBAction)next:(id)sender
{
  SecondViewController *secondView = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:nil];
  [self.navigationController pushViewController:secondView animated:YES];
  [secondView release];
}

- (void)didReceiveMemoryWarning 
{
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
}

#pragma mark Table view methods

- (void)dealloc 
{
  [super dealloc];
}


@end

