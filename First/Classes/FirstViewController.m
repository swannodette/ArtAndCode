//
//  FirstViewController.m
//  First
//
//  Created by David Nolen on 11/5/09.
//  Copyright David Nolen 2009. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

- (void)viewDidLoad 
{
  [super viewDidLoad];
}

- (IBAction)sayHello:(id)sender
{
  label.text = @"Hello world!";
}

- (void)didReceiveMemoryWarning 
{
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
}

- (BOOL)textFieldShouldReturn:(UITextField *)aInput 
{
  if (aInput == input) 
  {
    [input resignFirstResponder];
  }
  return YES;
}

- (void)dealloc 
{
  [super dealloc];
}

@end
