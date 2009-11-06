//
//  SecondViewController.m
//  UIFun
//
//  Created by David Nolen on 4/6/09.
//  Copyright 2009 David Nolen. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

- (IBAction)previous:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
  [super viewDidLoad];
}


- (void)didReceiveMemoryWarning 
{
  [super didReceiveMemoryWarning];
}


- (void)viewDidUnload 
{
}


- (void)dealloc 
{
  [super dealloc];
}


@end
